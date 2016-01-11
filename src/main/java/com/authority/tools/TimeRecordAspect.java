package com.authority.tools;

/**
 * Created by chenyuanjin on 15/7/13.
 */

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 *该类可以监控进出切面所做的工作
 */
public class TimeRecordAspect {
    private static Logger logger = Logger.getLogger(TimeRecordAspect.class);

    public void doAfter(JoinPoint jp) {
        logger.debug(jp.getTarget().getClass().getName() + "."
                + jp.getSignature().getName()+" process end!");
    }

    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long time = System.currentTimeMillis();
        Object retVal = pjp.proceed();
        time = System.currentTimeMillis() - time;
        logger.debug(pjp.getTarget().getClass().getName() + "."
                + pjp.getSignature().getName()
                + " process time: " + time + " ms");
        return retVal;
    }

    public void doBefore(JoinPoint jp) {
        logger.debug(jp.getTarget().getClass().getName() + "."
                + jp.getSignature().getName() + " process begin!");
    }

    public void doThrowing(JoinPoint jp, Throwable ex) {
        logger.warn("method " + jp.getTarget().getClass().getName()
                + "." + jp.getSignature().getName() + " throw exception");
        logger.warn(ex.getMessage());
    }

   /* private void sendEx(String ex) {
        //TODO 发送短信或邮件提醒
    }*/
}

package com.betfair.cougar.simple;

import com.betfair.cougar.api.ContainerContext;
import com.betfair.cougar.api.RequestContext;
import com.betfair.cougar.simple.v1.SimpleService;

import java.util.Date;

/**
 *
 */
public class SimpleServiceImpl implements SimpleService {

    @Override
    public void init(ContainerContext cc) {
    }


    @Override
    public Date getTime(RequestContext ctx) {
        return new Date();
    }
}

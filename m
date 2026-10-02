Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6634D382
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924848; cv=none; b=CGxGEn4/hAdn8cOUL5vGcI71vCVX8lsQ+6vgNPGeMu6EHh0NuJlPNSdeE0df52joTGSRT2ax5Knp8qOeuIExi7icAUpyVfxT6JyIUoiiKkeM9Kq4ROiPAU7iqym/+7UupN2ZW8SFeZTHkP2xoE5LfOjAcf//IFFEeMVl8bgT8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924848; c=relaxed/simple;
	bh=p86aoLipPnmeBSCQWRntvEIsHN7hwNunducQ3JxHt+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmdzMEtexv3tdR5bLuKWGltR3vN7htcBQAi19Bw0wAvoOCzaT4RcmwHbBUiaL0rdTVRrXkv/jgMWRBt+45diCKWCMTWBrD3Z+tanI7hpFlroJ/RcadKgEgay9GTP5EjWerfUZ98VT2Y1xhwW495N1RgNHzFpT5wBOcr8AfLHhGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpO/XKKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkCRuFIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpO/XKKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkCRuFIh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925il681542458
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 07:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=; b=BpO/XKKZUeyr+8US
	UjRKKSbDUo5AyXUeAqtVBZWAez2jKfY098dA/oY8kM0mG1v2uYNLcqj2/oYm8j7Z
	cabMaUqTC35a/WYTOrIizr+j1qoN/8fNKF4Vp4x0FKv7jQ2cskH2eB5u6Ru9yoHJ
	+ZEXyfjHGy7/6iLmZG1kQl+Vb0quGzMgoaZIH0EXOsopGaGEOm9THHHRNVz7PJSe
	MVX1kbW7AhQrFt4m1qAouwkQ0lUHO1JSl0LaoOGpTr2tqZgYnxdxZkCFdGAckJiD
	My3gOcv8g7RnApdNoD903atljeoz47BrKIxQDJH4tykr/xw2I6JxsuOclkBUlKDx
	LrYstA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mrfep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 07:07:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so1942250185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790924845; x=1791529645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=;
        b=TkCRuFIhJBtydq+DiMm+eE5NZCcOpyOWWBnQoIn+yM4vsysQVJKp7WNUEs82HCKfKT
         tLkNbYf4EoBnQ6QB2EECpTVVKs0HN1ifuSf2QZc+JLQPkdhY0J6NAJkjgEKPhRgpRQI5
         N/i9YnVr+KPD1wwT8q2Xl+9o4mcPWcfSeJeeo7rzX5/sVQAWMf3lgNv851GUyzbPFh+p
         nF6Gnqn9hkNW9O1n7ALsR5gnidH5txiBOpQSCbYZxzTMoKvEjkWEc3iny4br6/8gdics
         oTDq8DggKQfUMyjlZg5S4mVn/cWXM9XnRLV5RAlsFqR6QkPdovCLVfKyD/EakEvLhGeX
         CGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924845; x=1791529645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=;
        b=YwVs048RBq1yimXWbN+W9fogVoLO1OSFXzkzx2+vCXzQCUfVQtxdBUJNBorpKqNrWZ
         c++BIJg3BNTmQmWy7sRoK3IpbzyH2I9xQVZNWbQPMZqmbf3fJ503g/1en+vACmq1bpuH
         TVMYHIPC3eEIMP6a3JQMixZ9tNY3CKOGVrbTqm4HNO5lwd9kLsqbyGJeMkIrT0Ick7GK
         aFo08foyraJemL/cbw2jprkifPBM/EK3zi4EqpmSPLm3yTBrUOiMqYxpv++JTbZqURMR
         PI8Ey0zDjEJSOUarqaSDT2YuzmyBdHuxeZdD1d2rEaV3V65vIR0CcOJWD9PTxa3OiCOj
         NMPQ==
X-Gm-Message-State: AFuF++nZwokL/wLwJXS9QhDru43tzRJ7DFQljzQzKfoboDg1910+eaBD
	NXVAQeZr39QxeClly3Na9aAM+ncv90ubGA2/ABOk6BRiUTO6R8WBpR20efiTlLRHCq9N3rJSHB+
	Z3g0+c2Pj3gbzPMuNrFS5PEdwZZAMLzUYcfn8tsMdkzdYSVTw3lJ696u4OOmZSlIlokoU
X-Gm-Gg: AYBFou0nYcTOAsZcmrqy+7mIEMSbwRi8BRF7KKgfqcUCSYmnmPLLX9xpRbT0V8qJUKN
	gC43aFFfHLcAIWG/wz1hdcIVc+qD05OaJo44EXzbOPNyeoTnpCOJJz8pHMjLRBxVB+YUBSsB/XN
	wlUWCLCUmBa+nBy3PVdlcpt8z0ilAADNdZ9m1ShhOhdsUUfkfgPV+xgtpHD0DnNYfw3xJ4vouPl
	0NduV/MStxhhaH2kWMxc9eCFAhWrtNQACFHJSACO0/jy8o/59hhemdQG16zGzjRakLFtXqpHuT4
	0tyb5aLFyJbiVsuaY+6aYb1pLiANc7T8vpu2ebloObkv7GGGI3mKrGA3hzQ3Pv4/hLK091IpQlq
	kQY+AIKgywZ9mdCHVrfvLt03AypXZ1pdJ8bR1GfTWXAb5HY7Z0VSj6PYdXXGzEQ==
X-Received: by 2002:a05:620a:1992:b0:937:1097:feb8 with SMTP id af79cd13be357-93cf16d9c55mr286861085a.24.1790924845381;
        Fri, 02 Oct 2026 00:07:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:937:1097:feb8 with SMTP id af79cd13be357-93cf16d9c55mr286856885a.24.1790924844881;
        Fri, 02 Oct 2026 00:07:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm61000175e9.6.2026.10.02.00.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:07:23 -0700 (PDT)
Message-ID: <415c5fa8-d5b2-4030-9618-07cf828c8d01@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:07:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/6] power: Extend power_on_reason.h for upcoming
 PSCRR framework
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAyOCBTYWx0ZWRfXyjYtv3Sxo0/T
 UUX/LkOi727PrXnPPllSgJsdwTbc34dzGbl9cA8rOiazdpK0kqOO0P4Zl0vrNS6UqS1mSSze+Te
 DGxqPDDC9RVWB2LF9iZmQf+05OoJlYs=
X-Proofpoint-ORIG-GUID: KONyjOYY-O-r5Gt8S_0n89cOMKTswJSB
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf582e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=FITrd37hvkKM1ztSptAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: KONyjOYY-O-r5Gt8S_0n89cOMKTswJSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyOCBTYWx0ZWRfX9+ueszJ7/UuQ
 R/BOCjb010nhSJfPvRJjkvFUmOOHmtGA7RLtZFnVzOgQ7IlEMwRz9aB1OHLJHirkZRVP769/q0J
 qu4rNhEveyde9KRrzK8WXEqq02DhikLE9EDm5w1f8HhiWD1AcTf+aFWLVEusC9vCn9SZJ/HKNcw
 hOlOlivZG6WRMAd1XzEAs4YMS+aGT+DMttwV9z4AcjeRcoiZfupYJ2L6CLRcALyp7pdLJ7gSTIF
 QMTFSY9FugJxNN6m8hUyavAkQs/+EaW6swayXrWqvVRsqUZshh48g0nuIvW+tZTS3CPs5gQMro7
 2VksQf5u7mtJZV6jzBmugNdWIdH9fIskZybpbofakowl5CcodPBw3I/2vMF9HZXfYRSxPuuFiLL
 UDmXiNkf4wrttCfwRUtO47yu9wCsvnjl42sdwdKTu8vsJzlLMHRbtr/TWz+JrgZ3yjB4ydQ0a0u
 IFt2l49qPzUGerFUGJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020028

On 9/24/26 09:08, Faruque Ansari wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR) framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics.
> - POWER_ON_REASON_EXTERNAL for an external reset source.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

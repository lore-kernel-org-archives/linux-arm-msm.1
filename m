Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795053CA4A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004464; cv=none; b=jxeqizzpVZbu4XvK4Ec9cJ+C1WUIvssXrT9ORtQpdh8rK8fGMCUDlMeJg5lo3XEJjKSzAqhEJNqpPkP8ftxuyXAlG0spcBE1aLvD9iESajoBlLm0pIw4Kj+rKaDlDKov5ZKGQygroqLwjjEyz7+qtFskxVe6ZrPM8/Duu+ReF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004464; c=relaxed/simple;
	bh=IHNui2Edtj7RfSDakzU/n/5qDlIVockIk2fUBsZ73XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUGWT51SGEXyscBcVZEzd0/fMJuUKP/X/4RiI/lex/vSPjNuSb+Wx0eTDEsUwKCaxDZH2YXKqk+2mO3c3QKxYVwa5mnugBy2owbUc25szSVRhx2eSi5l+NLPIAXMJ1MaTcGGNw9/UBbzfm0np3i26Cug6IW/d82dyTXNL2ec6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWkjTE5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwueBMPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWkjTE5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwueBMPM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpgsK1672304
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=; b=QWkjTE5apijBfBE6
	nq2/otO/V/2ZLXOJPZ4IhjF77TvAVYeXfGJUTZijKqX1/2YBFj1G2Mwaeg4hRXaH
	oyrwWf8p3v6pXFMhsvyj77wSgTE2O8VB+tyvWIC3ekuA3HUMbUlu7/u3P6hKd+3F
	p7PXrJZc+LrUrH7gKmsP9L+8ZKTVmzSpwGBDBWZvY72qPo5b+6gcN/zQNCvVTLjc
	jaCu7CDfvNPy6WBQpi6MoeLZmnERpP+02zz7TmorU5QZsket1NbHfmbPEQ3/wPB3
	P4R1MgZVWBVuOsBEGzPLwEqvuQIVEVUBHlkO7IrlQoAbU+tLINl9aMQeiGAQ8E/9
	hBRu1w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh8r4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:00:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so6203027c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792004452; x=1792609252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=ZwueBMPMgFQvZ3rlx9Cj8TVBX0VstEROrNkl7r/1GVynEOFM3qGdkr7bt8SFG4v5LJ
         SMTdDqbeNQ3OkReoVM9WpixcdZHlFSveBgQBuz9fQWsdzbu6QTKIZKD2MKO+TyGJXagn
         a6gfuLLb1HGHSz9IAoyZFJJhKwS7SO0ydhE4zGvY62efJre7XYpxjlEKZ+cckKag+uAn
         1zgw2OB2jivL7N6FXfZe5w+9bHhg8vl5i6FkB9hOwsA5c4hP8m7WGACPb9wGBA0xh1o3
         qDXf1rl2breP2i0PULJ+UOpBQp1pUottJH5KZn0dJ5D2t2HnHyO7sXJFJNHQJXPWnghZ
         atIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004452; x=1792609252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=kQc1oAXCQmzFePQ//VafGNCcbpNPBPXG8OaO9qQjUl/4jKiSKwpRd+7V61ZMAXLiKv
         9Sc+cv9Wp5lBTgxoLleqLGKXe2I4is/LmSeGL286uyN6VqF0YrxnGOHtmLJCjWv6BUDh
         wPRK18y4DkSZiSdISheJ2+AlHBp1XygaFiId+FRT89O2Aq66jgX50MUPn3FRXf5UER1C
         E8f6F+5HRRc7vQ04n4xbtyNpiov0iagkiTTRvmIyMccDOl4lc9+lZ1ix0AvierB/ZLwj
         5kUDyJGHI4FUMUtglL/6U7lYcFPMuShFebrdv4wnDz0naR1N/3CpU48HLyt821F38fhw
         h3+A==
X-Forwarded-Encrypted: i=1; AKwUvBwCVxoKL6zhNIHBnO3y6XRoCMQf/qKhXekzGT1gqauP+E1PSVrYSH825nf9JgdvJfZAdX+QSELlECnLzHAe@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Tii7cy2PDggMJcdlsRy/0GptsnH8FCPg6l+Ez+IUUv/ckYuD
	eLS9Caduy0ariwX3oMH9JDXjIBWj9BwVZa2pbqboG3lBd9Wpx4CU9mQJAJjagUjcuhMOIyNoIYD
	oaVn/puVQ1y0He6xVgy+7n20Rz8olz4iYrQk//iapg7PfDV4vWe026nzvy1tzmb0QXzBA
X-Gm-Gg: AYBFou0UwqJjvEGvIu5OKEmHAp1H0Q+WVxn5cBdvz619LtRLO9MD8owTqU+K9gbutbK
	7v4IAnNOuN3+Rk0jNoswngE4Et8TaD3/RTOkMNl6ZNiW66zfCd5m4lgIQxsDTfaoAEVlB+kYEy/
	1sas/jasrpq7b+BwfNHmxgc1BDlSu8HPXkEwllB6HUwARL4seBGOJAfDi0SXMq01VWiAKhlJqX+
	9N4oD+k5s21ynCTBroqHEBQQFev/nex2iLcTDFC3Fxqlf0cEAq2hoPfg6T/KPRDVtrGFQl/Km+2
	Rq9u/R0Br2lvHjc+DEdgsMWAfCF0VDJ3jtGLmlrHfxzxWxmEdbIFzzJ+OUepGPNbknlSaZVta7E
	Dh+sq/lUhRKg4+72h9kuzFwflzsqA4EqegRtIKZdHWDXPxGYQm7VxXKdHxcHITo0=
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715340c88.47.1792004451345;
        Wed, 14 Oct 2026 12:00:51 -0700 (PDT)
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715140c88.47.1792004448426;
        Wed, 14 Oct 2026 12:00:48 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm47683131c88.11.2026.10.14.12.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:00:47 -0700 (PDT)
Message-ID: <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:00:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
 <as9XUbOfJazEQ4y5@lore-desk>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <as9XUbOfJazEQ4y5@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vttLIK2pL2Tixi_y7tdPMeqsrJo9tzjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX8tL4nJ22FWeV
 qPwi1Sms+ztll1c4DNm5QoJ+zxDeRzV5VI1Ies6qI6FXfdaXuF1Vw/UjqSleBSo5CTKiSqstx+n
 f8O5alh22vmLsH/0NNOKOrHnf9wJ61xPk6tfhqbHgeS+r7JxZ4y+IXOk90Io2F2Qk5j8OS2JMHX
 n9qOQFkSgoPZYGudshrM9CIKNdjLHFIOpA4RHVM22+RCNVNVklC4duPR+Yab8DGb27pW3V0R5fD
 jQef4rc7/jV9L1kGDbQKrGGCSlG8d4or7gZAWbzxjLjEsUJjIxy7yh0KkR8wegikNeLQh3Fyxti
 nMYufjNPITv1CnwzV54LUOY8XqfQVzasN/OyAaFYVHQ8oLs5Nq54qiA0lr91NXWa0EHCKojG9Ir
 GRmTmzA4mhBzVTDoTvTv0zapl7hIIw==
X-Proofpoint-ORIG-GUID: vttLIK2pL2Tixi_y7tdPMeqsrJo9tzjq
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfd164 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=uAmjrx48wFnj9rB13rsA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX+bnRsXPhpklR
 35dVKkp6lT44GY31quBCrmOzAKs4KujC4pum3OELD9JqnilfRRorY78jPxoEtF6UROV6wfwTi0c
 mn0qdnyArcNT1/bgvqlPalPWQZUH7fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610140075


>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 6719ac6e395b..65ac5403ec58 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
>>  
>>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
>>  {
>> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
>> +	u32 rdes3 = le32_to_cpu(p->des3);
>> +
>> +	/* when FD=1 and LD=0, HL is RDES2[9:0] */
>> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
>> +		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +		return;
>> +	}
>> +
>> +	if (rdes3 & XGMAC_RDES3_L34T)
> should we check FD=1 here? Since HL is not defined for the case {FD=0,LD=1},
> right?
>
>>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +	else if (rdes3 & XGMAC_RDES3_L2T)
>> +		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
> same here.
>
> Regards,
> Lorenzo
>
Hi Lorenzo,

Thanks for the review. dwxgmac2_get_rx_header_len() is only called from stmmac_rx_buf1_len(),
after the sph_active && len early return, so with split header enabled it only runs on the
first descriptor (FD=1). I don't think an extra FD check is needed, but I can add one if you'd prefer.

Regards,
Sagar


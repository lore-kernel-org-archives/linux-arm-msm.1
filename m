Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706459;
	b=xKY8rmBn+udi4bxGmt7r8iCnSPgG9DncHYlUuis/tQuVfb5Kxf9WHCjNGuQ3Swpta0f7
	 Px2O9BncTCjUkOChpAQfbSaSG5v0B/U0hxiS1v88JeBDIxXaK6YwDKruZFSvs9dZ3oBqu
	 pwah0e0XhmGWUN0Vvh23ecPvScQThjRjjOKNd2hnTcKjkaq/R100tvddPvcaWfZA3JRha
	 u4q9nZuqT6sDwM4mZMHYBrgMWR9sGiOBdb455Kai+OHWECC1eyCDm77Rx8LeFNd5nFQi7
	 1XN16DEW7yf+CTF4xPF8iRGR/uLnKCjpmCMD2E9PSpdFCWNMRZk6IODvBp0MEZbhyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
	b=j6BiSZfW7xGtDKBW/+5AmNYR7Od4nNUVm82vv2yczDCixmJ8E8ftQAeA5QBOmLpI9q0s
	 F/6PN/qEUc9dIeXcLuyEH1Nv+vqI+Tuw5JA48NkQTCvz7toFxQLsC//6HA5fQeQ8Xabsp
	 iFhqps8oSkbFs1N+o/X1ILx8LXO4+Pl/x7Ec9zBwreuXwUyEsITXnA9PK40jENigliRCX
	 hb4Cmr4xETtQzcUtV/51vyPlIHySWuxqSiUsr27Q/kcB/i3TN662V56tMaP61DR8//v8p
	 U5sS31Tg7omke1nD3uQQKWe0q9cGuB345CZWg0vcK3glaLfPSX/O6w3js8zz644OLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSg9ycfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA46606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA46606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSg9ycfN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMh12554833
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=; b=lEcT6s7NS/n9mC6S
	t5+EyoVw2iBm0mUVcFCfmLLzrLG3TSjf6LvKRb6miyQzMUXQMcWXkiJEk7BhSJAB
	QyN3vLhMuwrxjZn0VP2sIJxIRxKpIRTwUy+uay1/OqcalUe7doJuJxlvrTRzvj/3
	5oPNQRiGPnGV1f4iUb+BEUb/6CSvm6XtP7ky0fumzVqEBLwggf3yppRFxHxdHJJb
	w/IEhssBXLus2WFZiTB+7DtWQFCqIteGrOc/ZIkzJhV9cIKDzO/ZZ2uWxZuJ26st
	95NtxqiO8EBpM+2bFoyhIP9UeiCq3mg9m1/rApddhFz3aBGjHHQRq06vZtS6jVWx
	en+5vg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjyj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:47:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so9065634eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706456; x=1794311256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=HSg9ycfNAYsVn0bPrM5e4DVegr2lveo73rSlGVJB+RBejZ27/dn8H6G2yi01UoV55k
         Bs7lbQKQmz7bULd1PstQRx6Va77RK1n4S/xAFWQzG1Mv/uZejooxe/mh5k2/skVZn6rU
         bWN0KhHSXveQeLYNWF7iNtaKM15G3zQu+b6Oeeie5/d46h3wawUaAGjN4UIc1mqGXPRP
         R0BL+eKlhVwb1lZdSB/nAvlsCoMeaSD2gkBw8ueOGBez7rlKilyxaEZJlKWZWUfD0NpF
         cPcuw2BanZm2EJtfVlWDOTl/TSyzSB00xuI9qzPqfAb6WsKKAC85pxM+jX2gMyf2CVNd
         RX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706456; x=1794311256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=vvMSyOIatHrd5942/SEjiAmm5a9LYkP0t1S2qAHjdTx9iv7HaccqqAScFyscJ65FM0
         3MbbO0XZq9HMwbEeuePE5soIb9ppiaUfIZ+e9eP4bljCUn83Ow8l6H+PbwbdXzFp68uG
         BhOZiv67opUwoGFoaBb5v+1c4HQLL86Aet+tDKnrEH1F0bpD9yPeLrhLpoaYAbdPJvPV
         4mCLZ1Phl5KSD5EP6MbpmfTIVdRWTbNhcI/7EpRz7zStaZAwdEMdn6QpwVqWSCozczCh
         WrnoGsSkKJQgHJ6rOaII/UZRrOqtx7Er+xFmP5YBmu7wXbPx8b8ucoRwj60i4/FhnJPS
         43UQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA8zfgtztcYGW4N+bl87p2ye32Fk6X+CQ3H1nYZNW+sg9WfyEqMMKmf2an73/rIjbxDFVWAUmruMyut3KB@vger.kernel.org
X-Gm-Message-State: APuU4Z/jIlbmGf7llPEAed4VhTyz6dffXPu2nV/elsLLi30uLhk0/FI+
	At4UfQJRonLxS5LnDWPL/jdkmGIIJc39j/qj8yYojnUQSZsBsFth9iM7gx+ujVmG2LRZEY9TDyE
	50zX3maUoGp3feBBxFwyMxH/UVZVYRADOuL+DMJlph9d8Dv0CV5TAD/IhtKSY6pPqPKo1O2I81O
	YM
X-Gm-Gg: AYBFou1LuLmX5hRFTuPnFfXvK9vDy1cm3ZzI923TjM5kWw+8oIdALQfheB5V5ZXfSNf
	gBacY156/QaQUUCyjqA9GWHIp+oqOgWK/hELpj6i+apO9T6oGUhaCU6+v5E3H7VEsNGReU8qMzL
	urnHXiT62nH49e2MkExOVXF9CfM+H6cFcAxTimQsXJTOsUEiljLqFcOgrVoXQbRx4XjKA7dtV0z
	SK6B60hNC9jq6kYGgxAhvDGj61/y9IFtE0K1xoBa1M3F+7WllnT0YM6O/EsLueGfacbNnonUAmU
	7TAqcJjiPvN3HxIuj+fq4dJ70dF23i2EIWf7KNEucb9Tkon2fM5VUKaukuBuNYuk+PZpkRNrxhG
	8bOYfhgdiTCirRLCQeJnHw5p4JAm+FhQTX/9eK0PwlpvZA8nMBNlDFs3BrJDA8UlJi1EXKds9eg
	AzIqlcYw==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630972eec.38.1793706456466;
        Tue, 03 Nov 2026 03:47:36 -0800 (PST)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630950eec.38.1793706455973;
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm52840006eec.11.2026.11.03.03.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Message-ID: <bf8d0564-8ce4-452c-b211-94ac37f39209@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:17:28 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c9d9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX+yI5/9oaimCj
 1KE9xTBYQlMd/IzMtV6CU5XUsTBtsEhuKWOENSxSQKKJxffv4Ihs2GGO2EtXjyTSqWbntUUvkk2
 tAD1ftgcd2nLf9o0BdRDexQENHAdFBa7nhuqpUjaNV4yApwceLq8qIgqQlhWvdR1ZAN6rCQcLPT
 tR3DG8xUoOKr6XJyhoM3iOCSQKKxMr0HusuS5zXEwRZigMcqbAt8Jfm9/nhMql7yiFeZk13EcBc
 UBy01Jv3vwLkEy+6YYySEI+GnFHgzx3VsuhIE3SXGXQ6tLoK3XAfesWAUf/ruBGu221TDx0JNE5
 f7vAJV/+W+6j1QchZF8ahlXB8ilvHWwc9KRmq/Ny7RcM22rLjp1+3jz9TCYNI+BKvuGtxgn09O3
 bkEeDNMkmZsBSeC++T2F3zZa/bO3OBsZ2JvUof80V9upfPyAuqY5tHXGpAz3BplgOtB+hSn3noq
 74djY6izo1Ilx4gBbKw==
X-Proofpoint-GUID: YtyMB_J5V4ivRY2v3_WPaQZlKY8azcP5
X-Proofpoint-ORIG-GUID: YtyMB_J5V4ivRY2v3_WPaQZlKY8azcP5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX1A4szqaKlI0G
 wf1KdHad1tSdHH38jhEY7OyaK2X4WepHFiEwwzf4B0VKa7Vnt/Hg2X05yaY+Kc21qRimWruNE+/
 68OyMYsV4AADa3+tgY3/roriFtRqZCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
> SDA low, leaving the bus stuck and preventing subsequent transactions.
> The GPI completion callback reports a NACK and a genuine bus error
> alike as -EIO, and the existing recovery path switches the SE to FIFO
> mode which is not valid in GPI DMA mode.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
> SDA and SCL are already released. Extend the recovery callback to dispatch
> through the GPI DMA path when gi2c->gpi_mode is set.
> 
> Use the adapter timeout for GPI recovery commands, and preserve the DMA
> configuration error code when GPI setup fails.
> 
> Stop recovery on a GPI command timeout and report DMA termination
> failures. Do not issue another command or override the timeout with a
> bus-idle result, since DMA cleanup may not have completed successfully.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

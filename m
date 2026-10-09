Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A03EC813
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526301; cv=none; b=nNwKigVB30IFWlUo7Pf0WZZlHiZ0lilhEPq3VEntdt/oE0zhk3X+JDVz0uo52Vy0QbTJQFTFCZNVsaYqMmNnfhXpbiEHK+Z9CKMUBxnGFcSKDuZ1ZLNb+cPgJ6SnkX3HwmkiCdQ0Zrz5zt5QdQXkq4OWlWu7ZkWRhwHhstxXAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526301; c=relaxed/simple;
	bh=Wmkbo8HPR11OILJQCDQF6szYZaFI0eOI5BQs9yUQFP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J06D+tt93CTSZEwH/GtzqHJZhMCKAxZjCClRH4JLB4VDs/zbd4c6xqMOj+XanyuY7Tlt8AEg8zTR1mhzLzY8pLgijbYnjJaEkf2VoVwkUdbnZkPkoa9C9Ic6HOd0uyrBXB7K6UvmwKl7s2/fCu9EbMn9C6oAaHwysAz29IGLLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9/ET0QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Px91BeVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9/ET0QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Px91BeVF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993I97r3324245
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=; b=O9/ET0QYXa0ojnp6
	uErL892z606ka08h489t1yy2sqohTJMXEj6zkhVtM9OU8+Ds78XV7gXZ59fZDfsS
	5PmHDU/3ugLrCbXBTncK1ZinCNqHGYLWc/GJgk1HjExatySW5UpbIxgQI0afaWNN
	/e+i+tA0d+QOsOjPIwePoGllMg9wsQlrJiD1Z3wwqtDYbatEkrazcHVOSK9wU0kq
	shhTsCeDP2Px+IF5rUvQlgvkiOfgK98JaCeJxouhZEjf6QWtq4H+JYvl9YYXdZZi
	SfSZdUO9x+ejbxkaKzG1lK7Esa7P/VVYLKalLbUxuJTwp9e7tA6c03o1o3EjLbkl
	zmqU4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5afah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:11:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a10162189so8416890b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526298; x=1792131098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=Px91BeVFSa+pNMnnEUT7RCSW1B3ToiIjsS0HpVq5Ut6fc/gE/ZrIL13kB13S3Gcpm1
         RmZSGZvMGkm5KsASJDWH1mRL1SzMiP05i8bpP8bHcXYG+qakR5b0gmrm0CnkxhkfdcOk
         c9Zn81PENTmkIAw3SWJlsf5yHVfz2VuNULnxjSHcj6nTeLI2FceImtfl8qsy9Pt/hB3p
         eovj8TqSPMVZ9uImN61tnoxNvkO18hkmXZemM1Yf28f991rpBVV3faGVB0BEx01lieen
         SRtLVl0Jjqo49f/zWsk0xCk4VVrM4SUZHKfkvnZPuPbF2RjU+zSAY3gJ9tjzP6cl2chX
         eP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526298; x=1792131098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=lw5ov77qlkq/g7XrlfxtRm4oJYorihjlOmq+ilYG6c/zUOVu5CksfxnnjKvxiF/pt4
         8svB0LX3KuftiNRz6pJZZJLeHUX3WrPpe8Nb7HjAHb+XdxKMY5sJLexuOqziR9j38GZ2
         tjiiCYfAWud5djGEkasNJ3kYDSECfyzxaKbQBKOrIgL8YF2trrDIFUgT5Y6gkYkyicSA
         2fekKyRhPpoQ4f06L895lbE9NUCcXx7MutgnQgNcsM6AfRSI9DB/osdjYS7TF00gFP7j
         Lp4ZPa5XFvOsiXF937HRafRqUMVMTvRGxoJEa6cO+I2GU27oRT8ioZcLg/pkDkTSsJU7
         tMEg==
X-Gm-Message-State: AFuF++njGl8GFXSPQhQyJdiynUk3oCZhLnnNG0qQmsjfTTjpqOftrMus
	PMeyO8WOlU4b4ODD0jpqF0f0yGkhrV8LAYrfZVvxjvWCZ6UzbYEEVx1X31XdlW1Io2pJaJe/N0s
	/28ZCh65MyR3RlaGnHkmgGo44NP7JD/AaDQROWSDefv3o4h4bm9gR//GAmKQXir4j1/A6
X-Gm-Gg: AYBFou1pzULpXRPGLVlE/qjL3Fxwy3C6XG5t5bFa/35VykLdoAPJJIKHx1CSu9Ve9/8
	MVoKX3D9pxBTGemhVgQ0SEAX234SnPB2VT6Sz2RnFzIb6ol7/SYHWlUUWqSn63tC1UuFDfrqg4V
	DequkQ0RK1iIrVy95DJJjAnGvtlaYpUHbTkidmLWhVKxxjNY+Cm5w0ojnKyGQCRSSKWonVEXPQh
	DoGRBzNQorfT+/1jI8ANLvbIBiYZXEGReR666bYLIIADp2BxkclFUUcu3rWTjTOAYRDjOq6UH8e
	GrNkGmtkkFktPwI6EjUSvpke/LRlk6/ZxzSl1g2qsZzFoYxsaGLkAsQFjCPYWLtjy5RysKcwkEU
	IT/4qkjqmxq4W4O2Z1jAgHyYHzUqU
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701373637.55.1791526298500;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701360637.55.1791526298064;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106e07sm467718b3a.11.2026.10.08.23.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:11:37 -0700 (PDT)
Message-ID: <041b1648-1320-4394-8282-3d1cb1203d16@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:41:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session
 creation to the driver
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX1TbT51nQhG6j
 ahW4TcMzYhTthtkUAcr5xo2W95Q8al1geiomoHn72VNcx5y3Y7lAdJnQc3LDIA0iXKw4oVwWpWV
 XPBLsH4puE+WULrRErtABtFlMcrxqzo=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8859b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6scLBf4XpmJJRpZfmIIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: M1VwactxoxcBOGyx5f57lMHlRMGGSQyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXzH+c87G16nrU
 cbMgOdWxZmdzwtKJ8Re89IvSx3e1CeQQSebLWQ1VB1VaHDfUZXNLeD+Me8R9GIlS296bprQIVYI
 1m3GstTi6oOtNzfl4qRD2JEUP7L1ASg2sH9wWLaeSve8iDw2KxBPUzZJ68mJHP4JeIgV9Mw4BnL
 kP4IHDnO3LHWaP6jsiYVF0azDhEbT20fkUWkv4QSHEwz/5pzjNu+5xHcv3D/KzPoHIUp86nVQje
 u80Ja25Ak83QF9uc9rVgyx6av5vPIoaITGp9JORw5/69zPNT1xFQqQ1/dzUySq0pS5unEHrREaT
 uTrZgHOvL5hLDf+1oY+kO5aRDTN6UWu0lb9RnW8FG7CX8SLG5YKEAD53O7yGiRD5QP4Kc0PdXtl
 gy2aoeehTcDD7ePTT6/5wQyy+NgdEJ+cHe9DkNhdJhrLGz3Fmu/u8Noaln7hz0yV/Og275eCBWM
 6ukdmv64wTBrOu0leAA==
X-Proofpoint-ORIG-GUID: M1VwactxoxcBOGyx5f57lMHlRMGGSQyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To work around this, qcom,nsessions = <5> was set in DT to duplicate
> sessions inline during fastrpc_cb_init(). This policy does not belong
> in DT and should be handled at the driver level instead.
> 
> Remove the qcom,nsessions DT property read and the per-CB duplication
> logic from fastrpc_cb_init(). After all context banks have been
> initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
> copies of the last session for the ADSP domain.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f20d3e5ecc81..b29c1fd00de2 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -34,6 +34,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
add some comment here>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	u32 dma_bits;
>  	u32 sid = 0;
> @@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
>  	if (of_property_read_u32(dev->of_node, "reg", &sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (cctx->domain_id == CDSP_DOMAIN_ID)
>  		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];
> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655582;
	b=KnrypgWROxLhYmlOiYwzYLityHLaoIJOZgFXrVexFfH24CUZJMjxy7CtsA3+WZTdP6dR
	 XtrkBi04DZYoGbE0lUGp9JW6K400F+rrEwB3CecSIqW1UQGeTzW5SOETMVda4BhSZ8DCy
	 iKo6SPHX89Ethq+yeTnpJzXykcw/RdUMgqemmB2oTyMS7ysK2DEtbJOXwFYkwFajGkVip
	 xjO9jvAon2g7A1e/p+Ws8B9zjQcYTEjGBU83itk9Cv2yqpTyCMiBLA7uB1+7AY0VNBWbT
	 735ancKj1gG9QLRrIzkanzlf5Y2GAcJCqiYOCGi9yvxBr6Z1NpGHiqAM1j0jjzWrE8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w5R/EMiCSy5UL1544MdsdrlhihqU4IA08SYLZffTjoA=;
	b=GH3frlFA6622l8T/VbIU+pLebdYnlMmCBCwnVUqLyvp31gUzlgfq6NoXfDM3wbK3uLXv
	 kA8+JFkn5072XcQXcetOFzHvJMpxnG/LMq7ZEOlYUT5O2LdnV6dsdigEMMOBH1KlyEZSe
	 QMV+Q/EqmyqFK5PoyQrMwHEEGKjt/2AG2cgr7EfSJry10VCG8rQRSRmg/r24Ndl2Hr/Dy
	 4l7bmlSL4G2oKO+s//EEPm8LFnPGhW3Wa1usjtyq7tDSahOEczeF9D3UMQU2GvwvdFH85
	 9Ln9k9t2zeZvUzT6gDWPhLXzNIzcr2Nl5exl9XHAiuH89bdt63dyhsYCWNJkIm+V7Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FD/cWQ0z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCHmvtdC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559E606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B559E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FD/cWQ0z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCHmvtdC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702Mv3076364
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5R/EMiCSy5UL1544MdsdrlhihqU4IA08SYLZffTjoA=; b=FD/cWQ0zypBppPYH
	tbmhXPLAhxqkilh4cXr955iPq/UR/hDJHE2brirXN3GsVdedCGKuMAGq+hRfVFcD
	LQuulUdeFRW9Xm1w19TXnDrgYoEQzpt2Ap2BcKUG6WKZ657etO0MAxDOSAtZ3TbX
	CrENa1mAF238TwXAjrg3ecXGQXLOmhdu3RDEBdDn2eH1LSZyZR5G1YWleNm+rNqU
	KVQ3sM6WGY3NxnHFIMbuKCRgYkPViX9tbPMeqOAU9GNFHTrjAEcm29CRssRwQP+E
	dbTfjddRj9zKlBuStYaf9/9QW60yDRrHo7G/54ukGIeReBmgspeVuhCagdvuBVzk
	ufUTJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1a6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:53:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so42307685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655580; x=1793260380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5R/EMiCSy5UL1544MdsdrlhihqU4IA08SYLZffTjoA=;
        b=TCHmvtdCQ2wae4MftEKib9cRqAuTJiiTipQUzM6YvMWW92eDI1p5ReaqgZXqkm1aH3
         Hmjs//5FN5dA7C2Eh1fnoF7tjJ8mjHhiabtZJ8C40Qeo2Rcj8KmHFr5bG1oRrAc76fCf
         EEgVPppusA88we0VK1qUcNfUi2PJBIxDLKU3y7lO087A/j/B+rn8cNB7zkN84ZzEVlsT
         G+r2we2ng45jIb6XxNNQP5YSh+OpNOSynSQ3pG3oq3BDWJ4G/fSkPq+N20lMlxrq2HrE
         hScOzmygKUsOA25r13UDsq39LWc+oTzQnIWF73BDFXu8DrYe5UPKXdnhp+Vok7zc0qii
         Jcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655580; x=1793260380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5R/EMiCSy5UL1544MdsdrlhihqU4IA08SYLZffTjoA=;
        b=s5KuZwiVfqY/FRO0mRptkIH0ZSjUFkysFkz028RVieN58Otf5D4oFF9lq9GzqBk2Nm
         3LKtMGWdD/dYlSCyeMEAXsPA7wlFq0tdgKQGroqg+amGu+N4tkUfCUJfcmjc5zOVSVbx
         HEf3xaP2rDMYG8MRfUVxOxBanzYYkXuWhHQvLdrivTBZjBCYKgABbMoBhkv2lZ0RqPqP
         79COHlhmNPIVB6OwNJvjyUf/bBS7XpgTflZy/zBk3k64YSrisCM9pYkf8LM8qd2gzTJl
         Nh5b1zkUUNnHBrFLsD8d6PcwBPfC4GZIu15TkGfpbXkXwE+pr2PWgpcydKyPOdXs4LcT
         m/iw==
X-Forwarded-Encrypted: i=1; AKwUvBymiOtlcvKUz7tSKjP4TVJoGlfMdUOipscFViWEsuOgdHp6yU4aM4JJOyuOVxOdXNqgBUJHQ9cAJqEjmIni@vger.kernel.org
X-Gm-Message-State: AFq9FYKk4o33YkfrkVrjVfFB1pdrMPpzrtyEHBqgiHfUKZhepYDrLMYC
	2VFqp9yfLQBX8bM0WvSsFrIqRtV/NvBzgxgQYvmkPj8xf1iUltnZM03brZgxmYPQiixwuGdVy1O
	s5AmKu8/Uq/uxTDcGWk3FsGdrTCtU4rMFzcGQtF4qulXdzWv0qP7D6Y8N843jWVPG2Wrf
X-Gm-Gg: AYBFou1wO5yiDaIh0TvBrFjXHnz7+V2Gja9hMXh4Eso5ty9AEIYsPU3JNmLVL+sTNxI
	+DCSfVV+EUYa45R9uKD7xofY76tu0ymZ1cgrvqfJfTtee9Q/tqCVS6OBOujPU90gDb6290Ycp6Y
	mu15v3i3D5bDzye/7uwMazRNs24hrwZHN7/55Spop9rfqp/CzMvQ8/QZB+GlFsdtxVI2hq4M4Of
	4piW4/WbQquPF3XQUhVBhAdo38XNCRj0W17X2hCV0t37PIKIdtLWdYqTHXbMq5ROvwYpTaX57Am
	62UzEmPS21xtRkuW9nBY/Ok9v04d/Y8Fk6HE6p5SnMxEMJPrgQCsXFcTzAdoLdJwSf48nDd3VBK
	vbeN3LoCM9kepnX+H6mCiSw==
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr963215585a.4.1792655579869;
        Thu, 22 Oct 2026 00:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr963213285a.4.1792655579386;
        Thu, 22 Oct 2026 00:52:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c76fsm77938166b.36.2026.10.22.00.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:52:58 -0700 (PDT)
Message-ID: <21185cf6-253e-48bf-ae7c-bb160a4c089d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:52:56 +0200
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXxkq4mAE8FzQ1
 aiSaetfrAy/50gG1pHRx6A1YBGyiG8g4XdPBmKTC6suS+IcxDLMYPesKTRHvm9g+x8vgLYbwcUd
 WMtbyEqWFjo7XUFw1L+3cPtjmrgbTivuf6RC3dUw3HjMo3dAuGuoFAZjvMAfR5Mq0O7Jc5M2npd
 WSarjvXfcO3DBJviBBdQRUJpMrQThpFsvrr85KmTSDbS4SQLma3IuCPMDiYeaCVt/tlp8JaEuqf
 SnJQa9hBcfLwoPttR6SHps88KgC6iEwoDI3UzDtm36GIXf0C0cSPWZngrJLOrTOCFplvfk7ErRq
 Fi5U1qVnd5P3tjJXxz6OOY9BWgaCmCQodEPJGuU4L10fxugyJc3gpabiyubhLLCxBygwqD4jMLn
 S6rxGf1qVYugQBD6sziw04iLRkWkHxT/N61gUuhDdBQCU9pl9FfMI3tww2FpY+zJtvkexNkmEYk
 WgHMmpZeH3Q58DpI8HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXx7vQRqO1A7Xv
 TvmVpfg1Mrw4W9bRd677zojQYnmtYlwRiIhRB5JxjXnMy60iGmhlsmwl9a9T/32xyk3ZSw2f9rS
 3fL7zf73MWwo3pRfI0WoEvsCF0YqNZI=
X-Proofpoint-GUID: NtVcbvnPdXgJ9OtW1rj9BTp7xKASOz3r
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9c0dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SRtFinbuMe9puuQICA4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NtVcbvnPdXgJ9OtW1rj9BTp7xKASOz3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/21/26 5:43 PM, Harshal Dev wrote:
> Add support for a TEE client driver which forwards calls from the Inline
> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
> Psuedo-TA.
> 
> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
> Hardware Key Manager v1 is supported.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]

> +static int qcom_ice_tee_generate_key(struct device *dev,
> +				     u8 *lt_key, size_t lt_key_size)
> +{
> +	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_ICE_GENERATE_KEY,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS,
> +	};
> +	struct tee_param param[TEE_NUM_PARAMS] = { };
> +	struct tee_shm *key_shm;
> +	u8 *buf;
> +	size_t out_size;
> +	int ret;
> +
> +	key_shm = tee_shm_alloc_kernel_buf(data->ctx, lt_key_size);
> +	if (IS_ERR(key_shm))
> +		return PTR_ERR(key_shm);
> +
> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
> +	param[0].u.memref.shm = key_shm;
> +	param[0].u.memref.shm_offs = 0;
> +	param[0].u.memref.size = lt_key_size;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev,
> +			"ICE generate_key failed, ret=%d, err=0x%x\n",
> +			ret, inv_arg.ret);
> +		ret = ret ?: -EINVAL;
> +		goto out;
> +	}
> +
> +	buf = tee_shm_get_va(key_shm, 0);
> +	out_size = param[0].u.memref.size;
> +
> +	memcpy(lt_key, buf, lt_key_size);
> +	memzero_explicit(buf, out_size);

LLM says: s/out_size/lt_key_size here?

Or said another way, currently lt_key_size and out_size are not
cross checked

[...]

> +static int qcom_ice_tee_probe(struct tee_client_device *ice_dev)
> +{
> +	struct device *dev = &ice_dev->dev;
> +	struct qcom_ice_tee_private *data;
> +	struct tee_ioctl_open_session_arg sess_arg = {
> +		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL,
> +	};
> +	int ret, err = -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
> +	if (IS_ERR(data->ctx))
> +		return -ENODEV;
> +
> +	export_uuid(sess_arg.uuid, &ice_dev->id.uuid);
> +	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
> +	if (ret < 0 || sess_arg.ret != 0) {
> +		dev_err(dev,
> +			"tee_client_open_session failed, ret=%d, err=0x%x\n",
> +			ret, sess_arg.ret);
> +		err = ret ?: -EINVAL;
> +		goto out_ctx;
> +	}
> +
> +	data->session_id = sess_arg.session;
> +	dev_set_drvdata(dev, data);
> +
> +	qcom_ice_ops_tee.dev = dev;
> +	qcom_ice_svc_ops_register(&qcom_ice_ops_tee);
> +
> +	return ret;

This is always a 'return 0'

Konrad

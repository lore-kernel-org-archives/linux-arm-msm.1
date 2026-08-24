Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F73DE453
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787551951; cv=none; b=jLuFH7tzvNUqIUseoJp82yRb26imu5iJB3qUMhADVViSnQ+heNxdtbonjgGq9j5nIaexFAZYjyCD14nGca8rhUWNdy++L55Ey6nOzHTXBhTipe8cH9ORMkp76hl+vWDaBluof84pQE4AdijmJdFNx0xfoa6uJGmK8ZL/gOypB+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787551951; c=relaxed/simple;
	bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUkjx5OHggNw+m1VOhc8ApnWO9GxL7P/snpHp+REiKttBNjBa8SySLCF9skGPNrETwRsWZ2Buru8X/rWFiA8ttfAmFu+5iOyzD2hxQyo0zE5Ul/UquR/zAnyPc//zLAUGoiaAwTX7VdHDoKjoxCxX/s7o/oQXeoYFBPTDLzLPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDJ9mCE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuPdjslm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDJ9mCE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuPdjslm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RMT2866865
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=; b=bDJ9mCE8GtJiY+1O
	1eSD2GI5q2it/1mGV1cvqkCCrnGpxYvbF8Cem+kOFSzos3lOrWWfs7n6X1elvu6G
	nk9A+ZyD48tHJ8OINfvmSkCZ3AKB3ZmuLzEigWNtGUyJQ7Dkhu1Wp3JSfkmoJMTw
	GyD0TGZlcATAGtvaJOro0dST3ENOC+58Sr8y9OR/swLbKvq/FV/gt2TQ6YMJWA5O
	aSFEJsHtyhXQ4DEDVdbvXYws13TJm/Iy761cvzYkxKCu1fmJ8WqaGx9bIjTmcKT3
	s5hygI7ZdANdDFsbn1MfTbDcFB3/GHuVxkNsVQNA9yvmrFaJYG37IcNMiKLXjTj6
	dM/Y/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwjj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:12:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so6953081cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787551948; x=1788156748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
        b=GuPdjslm7m/PR9xTTHU543fbIaKSD/TVFap1MxWrVGVGX2JXAOjmBE+pkglXEDLcCt
         5wK7IZ3f98pEyu88q+3low6aVk4FTH6RJsSH9wLmSEFC1LbVxPJTfFcHReckG/OCpnNT
         qNuu5cbRdSikhUGIJAf1lwJ5iaYJ6Eay5aNSLLk7TveyWemiwOFiHfZ6VTXAjqR4UUUl
         eSYbdZidA1hKhNMZdbLi4/RfIsrRDuKFeHOqbK2HGLspAr9tWjMx6FUOT8cW6MsOKiCk
         kwRfIwJxfMzIW4D6tGG6W1ZPMKJ8j4SJ11YihNdv/bYvcE34YqThpwZeEVsVeD851qOU
         l8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551948; x=1788156748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
        b=dtLUvKYoJX40gm/F7snovHOifM2LtXeNWmdsVkd0+t1r9CKfAmv28jI3E58PKxnO5z
         bVm6t0llJ9OhCNeKE8R4ma0s9XifsOTbMI/9aottOCRdf4DaRNVRgJ3Ocr8kSiGFuSnE
         ga77nRkfklEZnnQtNApTnbhjSo11t1+cDwEjr8th0/K2n69IBL1Lrhu+afG8qvdLkORv
         /A6OFmQ3qSLhqhOnGCB6rUZfd85ry9YKerb1RCDRseA25QrZqkYIuDJrBqpd18STkm9i
         e91aLnRHbXaEPgDddHjBvfHRY4mGJZX40LSAk6hJtC7LenAFuvkOSQrwp+HbxFdJEKzD
         EJag==
X-Forwarded-Encrypted: i=1; AHgh+RpO7DzronXeh+EbrfbiCn+ZDGWQsG+cjqy2Au0q/9ii1XW0ON04fHHHmVk48+DxFMRXWbgDYWfDT8WJr6TU@vger.kernel.org
X-Gm-Message-State: AFuF++ngDAmf4unFjfKpEDlqiuJgpopLtvLabzb4XTmj99vltchM7FA1
	kp7rGQSvdIJkXEvxkx8PU1MSUAPAYGYTRRY8E3O09503LRlhXW4vSC2dTxvhXsHzNxmiF7SUvX0
	xD2RxnEHPG9Q8Spp7dxYAv998LgJZwzjDvoXUQtzjkIUpQdol91sRYTUvO/97rWpTelbR
X-Gm-Gg: AR+sD13D3zu6OvP+b7IO+IkX68aNTt0fKHF8KFUfW153qHwPbl1sIJnkuSwPMGjzPjQ
	0Forgk/4CxQSbHXta3md1bgRpQYJsJpQhMwgADc24rcYUDYiZMrofOl8w4uhWtb//EJwE4uW+VN
	UwmK7xZGvvsNjkCIeY075zRFAtxqs5kabXL5wir9b01tfay40Xxt1Gu3mp9CWQ1j8LBYJYzmk9S
	nSj6aehWZTGD9SvV5KAN2fhEOpgvDibIjEtMuRYHR79PtCJKBG/bWNbR9cidlH1zCsPO7HDKuFj
	5GTHva3AUr2PltPGHKrMYhzyhl+O6R/viswiqmuAMmj9o+v/4AHvCG2sfIpJVHAxo+8YS9moFgq
	e8q4VCof1xwQ6N3hT45yeJOKy
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr175961161cf.2.1787551947877;
        Sun, 23 Aug 2026 23:12:27 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr175960721cf.2.1787551947423;
        Sun, 23 Aug 2026 23:12:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968ba7b6sm1031837966b.62.2026.08.23.23.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:12:26 -0700 (PDT)
Message-ID: <7a21f01c-288a-418c-8c7a-a57fb40e2124@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:12:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Only check for PAS when a zap shader is
 present
To: Paul Hollinsky <phollinsky@holtechnik.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260821081325.89088-1-phollinsky@holtechnik.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821081325.89088-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I2SPZXaMfIYjQe06gy2FRNuLDeW4e0SC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX1ZG6q5XZv2zI
 HvkE7Bw7TPcyQksfi32MAjTDfw4K27NOiSUPYn/8Y3KAIR4VqyLodxpuNj5HtpKxHhhP1o2FuJS
 bqnvWjzaQemOGJjiz+NKmJcDRPbAC6aSPb+HXJtv4D/8svPNNjC7FrSwaacg5tw9iTJtgpInhwt
 6wKixlYx+4GYEDKOwEesrbR4K6BVW1137gyKdHSajcG83rUs9bkEX2qvOnpDfESMINrFgPGgtsW
 b3nJK2Oev8d+2/oJIrKu2TDwQndQE4Fmfnxrt09Gn/oou8itKsqcibRWT1D0BVTzIpM2majRUb4
 kMSOCcnyuV0nwnb9l0h8hu+mX9yybURApd/teL0froq93A36bjkkr70aN5gPIh3WHjlf9d9GKcU
 yiGdyXTM+mnlUMCsVJNmczzujwjne02deaWBdA5AXQ8QjQAe59hKcPhBrymqGjb4GZXr/zHZ63m
 JRGJ+UluYbM0U96Dx2A==
X-Proofpoint-GUID: I2SPZXaMfIYjQe06gy2FRNuLDeW4e0SC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX2xvy7ha2+VYf
 QrRRZASLUiE0yEHj8ZALy6tBkgjYMmX1a1lqzzmJhTwBRPkz0RUhGofp4laxOn/VDkxqIyhhSDZ
 1sQW7sLmv+443xttnuZI0jSJlLEPg5o=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8be0cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Bzkix8dev8cQr7rmkK0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240052

On 8/21/26 10:13 AM, Paul Hollinsky wrote:
> Commit 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs") replaced
> the qcom_scm_is_available() check in adreno_zap_shader_load() with
> qcom_pas_is_available(). These are not equivalent: the former reports
> whether the SCM transport is up, the latter whether the TrustZone
> firmware implements the peripheral authentication service.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

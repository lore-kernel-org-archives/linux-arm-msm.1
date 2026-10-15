Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70451CAA78
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023692; cv=none; b=oCnbGDVf8HEpi7AhJD8c5KOxpA+WvdYI83FRmc3XG0ZoZ+U1sDtvRqq9+refJAHxuwhDo6JxZOdFt3G7fmRmBRfIlGhipqNABIMa2ug95NhDpcJzmPGUAoYcpOh/Kr4uEH7+2cy0VEl6C+36isHykIxh2vHO0ni+OOO948lCFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023692; c=relaxed/simple;
	bh=gi48cupS9h7XgwY6WPv+vOA1JVj5jws7mmQ9ojMZxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcO0TDHMePxanlhvj9/A4k5kP7J1mfhodGvx1DbNhoVmKv/NJEZiLLJGG/R/UMDURkys3jcPeXKmd2GxWECsT/cmmwZhgTXzJC+2oa4/xHgp7esabLRmwjb1KaiLAgiGWOt97ueQqcKoJglz1T8xnyju6JSjYHdOAbeT9iOeuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUPkFvBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3Ucbvk6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUPkFvBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3Ucbvk6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZjXs3468940
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yaR/N3Tfnkuz4eGTVgBjs3mV
	pu7leTe1gRB71C/CEt4=; b=jUPkFvBK8Bam0QI2S0E5fz7hd/W/N6wZ8bCVnR7/
	awYjOYzdM9FpkunS4kPxLOXogbp5CIpClvu7+7XlbeR4hguUzz2h80W4lpE6RH4q
	s7aRLQZ9miMd6/KDpxUkB4Pd6zTcXCnID2VvZWeRYp2GdIYmG7ekI6SuXRaWJENt
	+f+aXzLW9kK6070UItNSO+5CgsLUjLjW9ffe3yB+0+34CFjzZMZoNMTWLTxkKiYE
	ElZeVX+Rqf8LwknyMqsgiHLvYLsyuHsC94egr8H99NzyIuHtKVa0FK+ME38Hr1HN
	em4bHhw/fvXcfhrLsGLI0vnv6cr3j8H7JUUjisV5aISgJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd79hvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:21:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso7512105eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792023690; x=1792628490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=e3Ucbvk6YebkuI3xSJzkF1JAhvFrjdS3lRofY+jCEiyOT26XHTRE+7ubzgS+OMgcZm
         rr1VupNsqlK9hq1B8PciFUbg4ZLBmp532kG0f0vauOG52+h8Bm0tfJKmXE0mj9KRLfRL
         AjVaOsz3x3yukWn7vwr+7Oz/G5xcvSLqU7lLefrRm++zMurbAE/n/1qQuOwA8IAezXCT
         TtaIM4Ycur5syVKgUXOYamd2kVGAJvdE7pciana/5h4imIyVj37eOhEn6C+53/A6opCU
         G7xpZiBUPY13xZ5gvE5TFLHCSbYxN2FYSi7ecAY+ddOSTiw9lECQlWtgema0Mj2ZQ1bd
         /jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023690; x=1792628490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=T8Gs5J3Jmkfqq8S2pLbzVIHWfD6WEO2n4W9vRuc+m+rhm1imBfdn0jzwjPi6/RabsA
         CmT8eo7/FN5TmbFJT6oV5s7wleqMbH6rOIUygNs88Oy030KkL4giyKNZqxrhsrEv+3nC
         f6Zx7whyfLlPEZgbvnT8/c4W0+vfD+ZYX5UU9cJgbjnlv7EnBV3Xg11gH4S/l0qLqLz2
         HcEf8qXZdmymb5yPVi6IOUZB4C39nXynup02K4sxZGOEO0jNjyq9rBeraED5W6dBxDvu
         ad4nh08c30aV60/5NueAFXAUwM/EIQUTyk/3nQcHwXzxZDnrUFe1zXAX8hbhkxTFK3wU
         qC2A==
X-Forwarded-Encrypted: i=1; AKwUvBw57wbruBOKNo9u7ZMmXL5lUOJWY9UwX1WLRnssy27xXe6lE3BB/M8pnI7dNTdkQJO0e3RpHPOnQQaFLj4d@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ4uquRTNsfj6it/LBULiI2iKUywhQlpymb4j5xmh9+jO7Umvz
	rCrV20oFomJt/vzPbtzwaV0dUJacWEWbJl4AIj3j1rDvWTsbxYjJw3APucGQSXaX135gBwXyVn5
	5niqJ5/mf9KqeY/qFjIAFtQsTt8YPBajiPuWT0N4qfdUL8aduPJC0OCrtMzo+3Tzb2y9C
X-Gm-Gg: AYBFou203XHkKAmnI3GzlBPvWZ2at/YYHwaIOg22ZyoDAkJ5wnTwdbqcAVG99ZmRENw
	2s6IdiNKpyZMBOjoRJffseT7VyfqtRGguojmJF62iPyDH0AxolU/1qD+/Nyhd5PrQRArmaAmISW
	CdikjGzii3kzKqX9jvmDkVBnvXmMfwMZQMvAPNZ4of/lWddegnTt8AXz0h5BFTJe0aU7IJF/SBz
	iqYHbF7Aq6Z1ws6MKwhxbUGIrfkGbI1dOeHhtpHS9z89GVYhu+0ldbnsrQaIpZF0xxgJfE0PPuU
	U4OCoJNnBRhH1Euep7AxRtExPbIzL9+LTCmCVN5bqWOA/xr8sQqLKpdojMI2xrA7MAyt8nzMfxO
	EdII/EgqRk6ZL0KPkdshv+Y565+dcrbcPMhtnQuEMJw==
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615303eec.14.1792023689859;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615268eec.14.1792023689239;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm41347836eec.20.2026.10.14.17.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:21:28 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:21:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Message-ID: <atAcgjjlin21jUHa@QCOM-aGQu4IUr3Y>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad01c8a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RuunLgntBIPE6M88tmEA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: uFVUE4VV__4XBxeIkaeSuZBcFlm2SfFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfXyC8ck1soMLvv
 gFMCgsfWL4RGEYnVBwJsOGnTh9orD4AyEvAL2itM3k2ChSYLubP4m+UEcQh2O1kar3Dyqau2+3L
 5nvkq4sSlJPy4FSrq8bUy2kXRgr+hLybS3NByBz628kvwEdAiKS1yAN9NbnOeoe/YASkEprkcDs
 fqhiFobbGYFjNV4nYE+Y4P+RAoOOEj3/w+AMsUNPJ+T5/qW1cASqHTFEQCkFCILhrSiyIqMK3yi
 RTu7nDIVf4T34hWHd9MAkqpvNJG1VdndIOfgiUTBXFrui9Eyr0vLZJAe1YMGgSplIWNK0aE8o1e
 KCwrzFtmTsDMkbFiAUvfjPJxtf9imq/nyM8M9uugN5YH8n1AlFpIn3Sz6NVzhzDQVbikDiC9l91
 IHT1EJ2ZPgS37Vk7d75L4aQHLhdQviXF56BEMBJx8/I2JrSEUXaRFw8AUrcoBeRyvP1GYpc/VN0
 qqPoUW2xm7wilzqo+Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfXx79pKsmRb1IW
 WuDjf4MpSrec+TpKGsnJ3PY/8X9cGSLblWnbAc0DjsI5fUwcj5oYqXcDKC3S4pED1DHiYSgyKuV
 vRY4bcFNBZjHWzyDEPo+T6t6pT9R28A=
X-Proofpoint-ORIG-GUID: uFVUE4VV__4XBxeIkaeSuZBcFlm2SfFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150001

On Wed, Oct 14, 2026 at 05:16:10PM +0530, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

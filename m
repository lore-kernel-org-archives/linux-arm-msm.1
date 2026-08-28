Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C23440626
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919234; cv=none; b=RG8miXrJGh/2xI4ZAzkRpCbz2HVd6HAIK1WMXVroBJHRRvtx/rQNomzQbWJmzi0ShvV0nnDHYwkMXV1XU3XuJD4OUrKoagUQpikgD6yws6K7fEXCbb7Qd98s7mtLBXjUGj/UG88/6VwBqic8xfJ70d1+/P98J9I83ilXvdO1P7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919234; c=relaxed/simple;
	bh=8bbaMqf1c7ruRGitXeSZN33UNs+ZfrWvXWxrlMS6lNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/kYMcXV+A3vCIf1qB9O6wdHQ5jNpGdiezfnJwkmFC8W7r1xEEbZ5j+cI+Cwj5aPbpv65k1r+VtIm2FedJhhSaic1Rm16pcyhAaeWe/abpR5IJUCfGs0uegsbGV8mED4bN7+1otVHlI4hRVBz1Ud+zUiadvTxFxEpifuc5oDNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXFBwlSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRdcaeIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXFBwlSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRdcaeIk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA82rX3064155
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=; b=cXFBwlSIayvExOJw
	UdQy3cW8O/5MVj01nytPH2LeafLa8oAmIwrBdNnLsr+4BminP+NQf0Ugas6V4VeT
	AHLN0JOw5r2yORGQBa9k0C08yW8VFf/FPDstyKSMpNcEs9NniQ0/zq1m05zhvmNp
	XtxgA0gWpo94bfxwI7Cu9uFyM5gkGaQz2clfcDgJabZVKRoCXyaIqOn59aBpEi4L
	p8VoPjtnE0hyUbTpho4ncVQ8qOgSF8frJd73sw7x6yA9vXR8rCuWh9s1yaHNd1Ol
	tfj9s+l+hTNDDnZgKlmK0/zTXgphi4aGLkBD95gJde/AID6kpSgAIV5OgBvELjQF
	rfU5wA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1k1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:13:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fbd0f0367so1320071cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919219; x=1788524019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=;
        b=FRdcaeIkUtjkFFtBZ7/K4IcIRnENQHc9iRih1G9bR4mI/x7eeiJG2DyaZw5y1ED+ar
         aVBwj5Jqz3X3xTY/MIad+192VkI8ijK6kZ8VtvPfYDTQq/5e01j7lK73PyLKRKYHQ+us
         OqB/i4d8mIGfNGAzWro/YhotkJ9z+6w+CIDtI+uoddXOFb5N/qlowbC/RKbtkKb76GXo
         +auvfT7FQf5JG1svMgyyrohjE76A131OfUT+D2sU1WfkLk9HouGeuW5dpEgYEgm6HWML
         1g6vKpBONn19XifSRLNuln7+N5kCQYBPbMhqUbmmXUi4h5FhPy6dvAF+ofmp+pXZYGaq
         XaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919219; x=1788524019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=;
        b=sowIBMZUNBMwt4KlvKo3FBnSu7vSmF1nQKjD7VU3sMYXBvp4eyHOW65x8scO9dxl/E
         U9uIh8TcA4ttVImRZyl+NHdxkUMN+K7xvxbk6uVpIHhC+sPXEss2PMMIa++55JOcoi3J
         IiO6Qig1Q3cWA4L09QBmVWgdELGHHQwsbK3Q/V3DfRSn/LTDa6hJdkfhtXotZJ84Qd8G
         qfK2elHloKtDruKz6mz8uzvx1k+E5utX8gv/O1pA7zaTS2Kmil+XVcblOy9KGDVIljVM
         TlwzeflLZWPBFk5Z1ipmu9XtoeJ0S8itZ3klMDYU5k/C8Oendw7mG/fOoSgz8Ney5P3j
         F63A==
X-Gm-Message-State: AFuF++lCYH/htFjV+3uEPinri2WgXHg0AaiDwo0lOiZoNN7jM0oBvr/7
	bYP/uwY8J+YtuO7eg/Gq7VRnf8eGgWvmASLVxG9tYtwgT3y+HwfbvB05/65+QHPjmZlr4megg5x
	BAbC9hX8b+yDmLT+5zGIkc3J33qhlGEwspwCjwVVTnH19RMYqk8AUsPtV0G5oAIme+0rg
X-Gm-Gg: AR+sD11QNx6mSRTy8Xh4PBzZiTiRLyTxqvohUJMJeuE6um7j9Ma746Or0otqADBHi0P
	JtvvWVLKaVFkN4/vCZ5HgMGygrHz5zspO2GtTuWKf2ulh6LnPpNh0n0yNHmTXa3GKUJTRedqrac
	H1bhin2nDfkbuDZq2bWQWC4DnbYS/pUOSJRbLuBFiUOYNJhlhfE68SGTkLRAVOPrTzLNbcWSDXr
	1hQ/ol9fP+WsxYwppvjkES+drgCBK2+JBzA2qLMkN1B6pZGz4AWm3mkCfoQzgjKqHX+135bEqwS
	tzdXxZUF6+28MAo/V94EqTLnJC7qe3jcNreB7LFuP59FdYSJ2XEg8ESC2iDV7HyzE4Bx5KwC7Dx
	Q6lJIM3T8Zb8OcawE3AIe4KU=
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr47069251cf.3.1787919214415;
        Fri, 28 Aug 2026 05:13:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr47068881cf.3.1787919214003;
        Fri, 28 Aug 2026 05:13:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c52211sm501354a12.22.2026.08.28.05.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:13:33 -0700 (PDT)
Message-ID: <c35dccce-999b-4a17-a761-57357e8978e7@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a917b73 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZTvNLpm-z4kpgeIlWLoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8KvUsw3sPFgIgYbPpVWSLFZV8zstAyHk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfXxaPHFXRqjmkw
 LZlfjyyWbtzyVJVzFHpHR63fN7CfIQrPhze0XLRPEN+jLYNYUtnbb89BnSuluoXGJEglvTWX14i
 N1EzS3qt+Wja1gTRxb245LKdAHIBjNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX0FZ6v2s4ei09
 TCXTEiS52g5rRvRZsNuUCg8Htneuom8W6Y6Zq9PPNo0FEuc7IjJq89W8jXdTTciQIyMAltDLBcs
 tPqzUG+GeiuzbKFvJn2NRpyZuAx8piFI2mK5AGBRr2lZEwkdqj38N1D4WS/WX6Yk/nlVsvWtWQz
 XhsDgBffMOMhe2nSLL0HuRM3yRoYpkCuId3pPdb4hNjEi6TX7teCT6gfyC3N3eTfIEBo1QqyN8L
 319DvpKrD/Kmp88qhpNG0sZ6S37fKZMCykjRxhLOyDfD5/90vbsIDTyd3+yDEzCCUdEyOa1UgwP
 1z+hj+/9dlw/ixoRnGR0OABTzV/f4nz5R7JOTG7+naVYJBDd8KAUSqgJjgwenP57hqZcwTtRUiT
 Imvx+ca9okiA6wAOYlFPAPAwE3lJn3q+YAC9HdfCY/iC1cyFAINcepNsxEQ4NsCF5nuO/sA+YtH
 PS7mE9r92+TC9dpTKZg==
X-Proofpoint-GUID: 8KvUsw3sPFgIgYbPpVWSLFZV8zstAyHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

[...]

> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);

This should be 0x2f on Glymur

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243842B303
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800792; cv=none; b=eSOTm66mXeVgXVDY6SSvZDWi7F8YjMiu5dHGJ+xIieQUfcc2cB6JuBbvhI8fNK7GZdf3svWdjuAiiaKNZISYcJFSjgvAL18CId5NATgKQFynmIuUkod/MO5JdboQhRRrF6b9YQJmnUkCuOqa+4fggSF/HcsOuDYkT1AiqzN7Xus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800792; c=relaxed/simple;
	bh=wu6r3ZNw+XXWQmsPOWxPu9W7TaRQ182lxP6eznQUIGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGn8IzvgHqJD4+PD0kSzEoZiRu8ysMHz/Z0tu+AEhh8sKj96pWUYtByRg0Ths94QjSLmNJw29VZvaayXWrPlqaAyIbSK1PYbPljugXBG3Muw7IZG7UnengBazA1K8gli+7jgib8/nftlQ9rxxhfu1yxmefDxOC2qtUhfZs3jaEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch3hcOWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZgIU+pj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch3hcOWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZgIU+pj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qkYN3642784
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=; b=ch3hcOWhUJ42rYKA
	Z2FyeXeu6NKQBuVtRhq4fhTr0SrEAkguYgySdPG3c9H8ZNV5fIDzrBLbDcbOXDBQ
	FTF1SiUlDJ1WyzpqFDiUdFqZZM3PZEKiy4g9s+RGVULfeyVCpSeDK80H5sU6ppvc
	eQtAQaW+4Evj6fKFfSJXCByanU6N/G/qHaeNtk7++vPDU66YzjDQ9xYisA5zkPKI
	m+Lko1wNDRButeN/QS7sp9pqla5leEnIF9dSbG5Kb70mdaUBUyLRa/2BpFMpdoU4
	wspqgBCh1wHPbhMs7rChaCCoEid9mm3yJS9+6XxDHwNLxAn1eLMQddyXI+xUQ39W
	r62myQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh9f03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:59:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93105103d06so10866285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800790; x=1785405590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=;
        b=IZgIU+pjA9qAqYO5dMWKtM4TrA1K8OvZ7rAyOzsMM3lNIUKvMxfTcTHEcsw+/u2O8R
         ST5DlLdfoTXebj1CyRm15WpAq028Zv9ABZNxjNmTMHn7ec/QK/9MV5o9ooDVFmcfRjhD
         HU4Uf2Tp1QFVWQXy89bJU+yd7H+VS1onjenyTRWhDpYXR6gMnNoxZrTplC50DjFXinmi
         UQM1zN7TO5z5BK7hRYwivWNVJMIMZ0nYQTP0VyaGJVubxLffiicsNtNrW7J7WcCIWtBh
         ZqD3INKLXbpO4HZOl9T7GGf2Eff8JLaf+EjdePumnzWgzh5FoI1+2Id1oS0rf/8hoxIb
         +k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800790; x=1785405590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=;
        b=PAxORUaYIyBQCAl22EuZOmOrip4oWKyfGgWVN0zDaBv6ec/wI+DfKWbwtKFvJP559o
         U21cEAifOEFvrDdqD+Cglxf74m47TYGgZYDIY6W5DR/lVA1MUJNbdlhT9OGHpKs25BAC
         Eg+0DoKihLoi3NNhmiVf9ixZAwzh+/MO2gGDlX42YJONpIza/PTpSCBO0K4HN3oszsW+
         +Xl3Xg77JCNg2PVL3uFVSeTca13gu5X75+Ij6bFk6kf8nh1WJ8RJOFnhnbCI8E+r50gE
         cqalU+6gf1XnJk+qofklajlO2W/YxtyuVr/6rHqLDjiTyb6nGH74O4iUZW4lxkkz0PBd
         V/DA==
X-Gm-Message-State: AOJu0YyVHOW3kOc2nlMeFvtXcLADEKJnsd+d3f9xwaL5kx6g94wwC/Ym
	IFDYPMPi3pnc9zUUKW/IUI5xudxZ0BcVNdOv8evItjAvfFsS9uu5KB/a1V68a0jTGTFZlYDXlas
	SE7VswD2wjU+Q6gxPEnEDjh9YesxKmAoPXANCbgSjXLm1wJ0q2rXYjBzofiFtt0Lyc/+3
X-Gm-Gg: AR+sD11HqFeEoms1pz6bMUqcg5r1JDVOvGogoI0ha6+w/C+pv5Xt1f6wI3Oo/HpHR1F
	ZsFTmsan6CQo6o8I2AQzCBNTpD0gwDfVsluGr+f4X/SCh29FhBQQYs7jdLe/SoDvcPaAR2b8q81
	mwijLoS/zhIwo/W6l9BC7/t+4+GlIKHE6sdrm3gLK6k6f22VdAEmLe4TsMsNcfquv11IWotBxP8
	L+QGNyTRLvibqlLeIU4os4loYEgEsbbewqHi9YuFfoBg6vEnm1M4oAktU7Bwf0+v1Uohpt5VrOM
	F1k7TAUcHH5UYB33HHemUtXeE6CBGNC5PCZUXH+DcQCiEoX4dtxE6Im8Tz1ggsBJUaullaBgy7f
	qwIYLEMySvacMKeqCc2LshjMg
X-Received: by 2002:a05:620a:2a07:b0:930:f930:a09f with SMTP id af79cd13be357-931036542b6mr185430585a.1.1784800789722;
        Thu, 23 Jul 2026 02:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:930:f930:a09f with SMTP id af79cd13be357-931036542b6mr185429785a.1.1784800789324;
        Thu, 23 Jul 2026 02:59:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c8ea94sm210349966b.41.2026.07.23.02.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:59:48 -0700 (PDT)
Message-ID: <895453d7-2087-4639-87cd-ba3fcca9f657@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:59:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61e616 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Pig3eebz42euybiH1koA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5qUxQP9YQVjeJ6D4GJuZTkkn9-pH-iUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX0IWrQE9Ifx9q
 FfGkWcq+I6HeuqIccGTH1orPQI+KaZoU1RHBYYOy3z4BPUMDlZPBaknN2SomLuzbzvavzAnIiPy
 NW6ulgkIVDyZImgJB4pdtgRGUNkOacxh8JIPumWx8JKSBwzMfp59TgdOk3x86vkhNtBKOpP5U0B
 cfqqTvcoEyxig2pL0eGqwP1o3RaFhR9ZCY42mqGrjPOnIKyR/geYPGC3j8GHLgk25SDs53yIkV8
 RcQ1wfO4vr4f6KObIAV9PawgVivHtfykX1xsFuYLPxer7X1g5mi7WB2HydHm41J7EWCyi893LgB
 FyXNZzUC15vQnj5qk6vgchvryybdyQIn46azrUcn4V3vG+JRrS2pBMnbtVaot0vqtZqFJZgnVu4
 mDb44vGagwjBVzkopuyRL4+/GAhbMTKYAOhppkVDp3L8W4h5Jw2r5YpJrUWCTdS9z+q3O2i0/8V
 9vv3fbw4cZxVi5qbgbQ==
X-Proofpoint-GUID: 5qUxQP9YQVjeJ6D4GJuZTkkn9-pH-iUm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX/Y/jHKNA1Vbn
 31dHLu/jV+Gl17F+NbZc2IfyVGCpF8hfUQ+ZQ7zdrOcUURheSOP9F5oIfftcnqEjScBs6wUcXvw
 xDWuUagj2528U+qMq1b/FxeWR+vkNO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230097

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> rproc_del() is subjected to the reference counted shutdown path, as such
> a remoteproc with more than one reference will be left running as its
> resources are released underneath it.
> 
> Refactor the shutdown path such that the reference count value is
> ignored when called from rproc_del().
> 
> Assisted-by: OpenCode:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

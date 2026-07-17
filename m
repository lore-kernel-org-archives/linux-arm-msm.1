Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54073ADBA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300684; cv=none; b=k2zidKCrnxG39iQNcPzNriQXDoFITIZQ1rw7c37loLoEKDCEsaf4skVz2c7e/FAnb1fgHF98w7BRVxYY/bGmXqmSFOjQhigr85YD8cilIyD2VAigs3aDve6NbZOs/dU26fbl9WF6QmWvMDwivBPcYByCMrLc+hBICLLcRXQ49bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300684; c=relaxed/simple;
	bh=2QVwQq54txjm+tz8crvzEY6MS5j3yuO8G5yksIevunc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/ZP/EZP+7tazrQRWeeuAg5+P+atmL8hJSeYvKbG/9XXOlhc7Qo6KJs9d39CCbSnFb3CX5hLWz0keeb398eqnE51mqhEsYOH+kelqJVPZtrmlcmPfxqoq8AsMycG5YLEOeoKdsDSTOh83sQ2q+uX5JQ5vLBlZSuny2GR5krY4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSDFHSmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuZOSlEC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSDFHSmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuZOSlEC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7maT2002015
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8mFE4Zuem6D5GuQC7kLvFWE/
	dtUJIComejuqrkkbY3o=; b=JSDFHSmSQFFx/hexVJNiyKN2vqwoVtyxqD9L+lQ6
	twtkyHBAnroclehLzOhzHJdkowq1vF1++CS2F1RiRpicatk2UprFYJCEYQIXMyPw
	oYJ0daKUcfz0eOVTRNizhV7UeeY2adUCtiStIRC9DfmFdg26B64sBGv4mFjVR+CD
	CMRHO9UCud3PlKYXlNzkpvoI9C19XiK+JnlkKOtH0/ovdWwocVGdUaOKkX/1stiS
	t57L/82PJpk60CKL+ipVG3E6uGGfuFj7nzyncSeh9zMWgiCh0ElfIhsNCYCe78Bf
	3isxBgUu/thBn2WEM/KBFJP41CoSUpeWB1WTzDe1AN4OiQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsxeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:04:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso13862575a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300674; x=1784905474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8mFE4Zuem6D5GuQC7kLvFWE/dtUJIComejuqrkkbY3o=;
        b=CuZOSlECOxlWokMWAYAna5lV+dzKjA+Fwi+UO+5gIWrVT4h72onAsxwX8xaGVgDSLS
         +Q21UAbDwvZjsP+zAdxxDT5DXsx0yoXha6UHwAiGxrmjY2cXG5g9WnQ2dN8qaqGDCfwR
         OYuH51CSW4P+1/EyPBDcc9+pnmJMDF3HxU3dARusPXE2lbyx574STKEF6gWZ4KualNeu
         Kv/j1DD1l7LwN5hbPTWXwdQjNrKbM7P9kseFr/vDcpn5LwEaZ14g3W2XODwtK4JuWPFq
         7qS+YLG0W6euwo4/KabVLbUXCVANVe6rafkQNuRNGg51ksSt9RTI4HKiqDbhukChtUfn
         HOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300674; x=1784905474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mFE4Zuem6D5GuQC7kLvFWE/dtUJIComejuqrkkbY3o=;
        b=b8X2ZCHl0glnzD9mgSlD/f9PMgqMha7SJhD22Iu+YBlTMEoBX6EEjMOwp40+vvktW0
         lxdNN5gU+tuoRGaUuRlsiB3z+oDhKVNgJN0JXPFQNR4r4h7wVsQU+fWu+ieNiCIF7YNd
         okKBm1WTbH9T9OKhz5jovnvgRCiaAUfY95z2O6hmNwXcXkDJlWuThGfSWj1YQy5gGJ7U
         6MOBI5D/hjIqWnvbV98jINuDfbRWoK6PVkeconcu8u8xPsvYuSGnhCOpT2Gw/sAJZqEl
         HetMUsTcz6rVCWZUe1a4neWfiSJ7F21YArFcUiXjPybbJyP/mUWfYuWWOZxRD9YM5eOI
         OjFw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4x576KvCGegAJ9UjCR/YygM0dSUJj4zCNJtsc04j0t5BuR1xeejxAS3sDRJv4jiJg9TIq9ijI3fN/p4To@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVYgpk0jIdYzxRhumfTXxcx7aHsLuH+x47bxOvauV+RiPebwh
	aaG2phgbSHZ41EgyS4UCFhurMOdLOeaL1usr2yv2WDRkuPgbLe1M71FduDH73JeFd+cb12Q15av
	Oy2ZSdPHPoqw8N1BQVIIgmqOEpAwfxRyMZK26Ffd3Ii+s+6M937qa4acChV1byZc+asXF
X-Gm-Gg: AfdE7cn/sG9sWn9g94X5rKn/Allw+56OKiPE7PVqfmZQCy8C9p5hQ1wmzlQGNKZdaQ2
	EPPVks/2FKM7ZJZ4qaLQiQHSC3hIttfb8rTQgr6xjpW0tVeSTQEUudPlH3SDWGCfI1EyNdD//J+
	MF1uMUde+mJKQwaCAJlmCe1Yf9nNwdkAxYvONMLHcfbF1Z39GfVNz9QT1cUJ69NQhzXufjjw+WN
	ktiRK1z1htF3nh5bLh2mmXMyJ7R/0ZtGgfpgmbxbChWBasPkrWTRPsDZ7m/OVs4J9JFZKJXj1lH
	Go7efnkm8Cm5fXalCOOFJSWMZ4k3hSL82Z5d6l7+5x8JRmsNUypOZM1xItj7X7uC/WurwVhp4jz
	QkKLma/BYPBGV7jsznX/DD2EammQ=
X-Received: by 2002:a17:90a:c885:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e4b538938mr3291392a91.21.1784300673718;
        Fri, 17 Jul 2026 08:04:33 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e4b538938mr3291259a91.21.1784300672917;
        Fri, 17 Jul 2026 08:04:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm6280032c88.6.2026.07.17.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:04:32 -0700 (PDT)
Date: Fri, 17 Jul 2026 20:34:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Message-ID: <20260717150425.nfynctjnqi47upw3@hu-mojha-hyd.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX9kPPZ94rxmox
 LMqwfN7ykGAb3EzWaRv9ZKFfHP5rqM7mDYi/Biga3cqLu9vPrAPPLLuZAphWc6sz73BCt8wbw9N
 kQx/Yb2901iq3kkKukETJOAcB5qs4Sg=
X-Proofpoint-ORIG-GUID: iUpuDU3W6pgW870mDvbAMicBD6UJL2QV
X-Proofpoint-GUID: iUpuDU3W6pgW870mDvbAMicBD6UJL2QV
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a4483 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IXoLagY9VYqCqr7K_xUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfXwEjQhxfeDHWy
 FZ8Q1EzU446yLSdEG8EGC4eW9WbQ8DWKX1IqmgLL1j4SSAJLSCnzkHKwrvDz780QSxHJpn7EspV
 p0hgqVCHtEbsipNmfilPZjaiALp7BhEOMiuaJAHchkZdI/O3FP1MK8uTtKmkT7qtUCfHFfJs9/e
 XFMPndONVrA6kNSAj3oYjyfhZJwdnKr0j+7A1NrwPrQlGxpVcj1Uax+1+m9MkrN+Kf2XPGwq7N+
 gmdoA+oIyYHogBmDvNQqDELy4XlIlPcyVYDuxMTlt5oV66hlZNBLgUbuSqt6r004oGXDQnPGX5+
 2gZuX6D8urDeuwwwpzb0UJyDz0mwJboyV9TkS11gmulNATkV/EKFCvHtRf6Q4kevfG+kytCziLo
 r8fR+KJ9s7axYfzDTPIVmnqoYmGz+fPl5OYVCK1J5ljGZiniQry5pYt/ihePl4C8aMrqtJC6I6F
 SVmvvIxy49qC3nQu0wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154

On Fri, Jul 17, 2026 at 04:54:11AM -0700, Gopikrishna Garmidi wrote:
> Add Glymur QCB board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index f35f2ee39130..e0ea40b4302c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2326,6 +2326,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "microsoft,romulus13", },
>  	{ .compatible = "microsoft,romulus15", },
>  	{ .compatible = "qcom,glymur-crd" },
> +	{ .compatible = "qcom,glymur-qcb" },

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha

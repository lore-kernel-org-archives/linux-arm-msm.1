Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76442AFAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976945; cv=none; b=KTNCC3Jp7VDkZjBXtVn1TxkmFm1KnEUNOe7ne7ZRM2siIR0b/QykbV7MRhmBkbSATMucKN23nTfKxF1Ic7BHvwUuWMoJE3zV8GDJPxcHFyYFoDjalCTlm5aQnkiHp3ATk7BSCENUhfEk5jKL8G8plb7NI+C1bnoPBaKVGKnkHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976945; c=relaxed/simple;
	bh=UiTjHfYjpPtQv17SamOYFpLTKfUsC0/r713ZtcvvPBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpGoDit3OaQEd1gmY2Dr6voaVdB9uaJIXlvVnVUEvk79rQo9mapuVkn277I7ojtbDSS/5uZwuGa/3rOK7fImsYHInzrdyEza+hgt+d+U8u5v11eoFGz3p5m6h4JGuJefo32KeUaYEuHAlKAWrdVCovdDlQMlMPJjaS+HwuMmz5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAtRnz90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bm/gQf0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAtRnz90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bm/gQf0j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5uhu1994269
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmRFHo2gTVo8kNvX8VrtEOpA3zAcJQk9MWz/79eUlwQ=; b=OAtRnz90yH/3NuRA
	HXvzEGVIS1T1ClFC/1wxOPD6ThrZjd6dqH+3OMsivUW0pQqinzbvqqMdoQaOUgWd
	v4x60tkCMNNJhDvb+X6HdBWN1+rCjw8F8T7fvIM73/2twwXVP1G9CHwgSWnavTIj
	o7kaPCn1L+Ed9pittAZ/qBhSdO6LjawsdvM/mVjefCMIHoJwgLvuXLzDYqpHM100
	0M8bAuWhnI5eZ3HV/3dJ8w2wsEJxv/m038LXdbWBXJh1Qn/poeBKeaYG/O3pVW9t
	ceAg08N2s/dvmCVz+CeVixzH8UqjJoSnFikPjRxf9KApM6a07HHUD12lPuy2kOg8
	bdtw+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1hf78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fddc6aabd5so8512856d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976942; x=1787581742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmRFHo2gTVo8kNvX8VrtEOpA3zAcJQk9MWz/79eUlwQ=;
        b=bm/gQf0jRETtEjv1HBjerLxYca8Xs25zaBR790JKd+IiTUVPLn4mfwHIK0ri1TH3uS
         /MELNIwEXgH8Y5mzA+E+U4mzUTBKfTxL6LZM6CTMECPpi9pFtUg/9ilF3t0uOoeSJLi1
         BR4HYmHrNXVnJdOMExUEWQpjwOP6kUjHf9uUceA1CU+hnbCpL+MQKAOV//vU/DDNpVUd
         ct+Z3ooJqC4MaXeEtKwFEtjlx+rFJObS8vFpu2GNUjnQmGzn5397Rt96/qAWh2gWtNpN
         sWhrtD8vg93bNeTcLffJrxOjG9YXm656a2yWKW5d458Gx6WdJRp77CB+q28vqwSSh15M
         1lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976942; x=1787581742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmRFHo2gTVo8kNvX8VrtEOpA3zAcJQk9MWz/79eUlwQ=;
        b=sg/lGlSLTuLONQUKj0LZ4yIflAtUMvvl7Q61kYg5IMqXOC/Isxj+KVN+BLbfVK1hU+
         CVvuBOBc+FhpfMmvRcd7DEQKSfyWRhVKnZYaPOHYzC2yt+VXi8bPdWQIvJToY2DZeiH/
         JlhwLe+5yHUm/xc6tFNBEH3EmQwhs5H0qgQw65n2qYYzHGZxCFtJfq+UdauJ7G3ijYs/
         of5HI8+KIIWkq1De27fwphcKbhKNUDLCV2yPGF4JFv/vSlYbZEsz5C2VFtfz25er2ZZH
         TNGwB4/YAHCRU3bqsYFHLO/eksIMxhLtswvLdnEkpGnfUEseYUwNtYQ/jgsj44gA7BT9
         UTyg==
X-Gm-Message-State: AOJu0YxuE6wyTyFzqgUd1lSh1+REFVJo1cM9bmED+8S2HB+vJr+5k2ka
	k/V69RcjbpLDBB/NEEpwNpZgSTsHnJDVZYr+HxR6ohxHHvMfqJIGAY3qU4C1zp3EbcOF/1Bnjoy
	z1NHE75udHo5JJ31EYxb+nV5cXjuCzo0n7/dnIJ97/NyUCw3ZVA4BuL9aU2wmbbRenJjw
X-Gm-Gg: AR+sD11WTmOiyBEz6rHQ0Q2w44o8dFskQwvSHuTa/stavAfU4PkxOBjdgEIcStJHSy4
	lWamG5iWBCbr+37nuodvYg2gk+BOKCX6gHxmOpdxW25YE4ATny18AV/c+6cxs+Aqs4LAjOmuvBg
	4ZzMfDsEFrlXaGk8qeWSMBrx6JkU+qleSjp5GoBgH5ZadpZc+go9w/2X97lLLMo2T21p0aGBx1/
	JMfIr+OZBnn0fAWHcx3K0YAq/wnwdUly9La0sPcEqJ1j12zUHOKhwIHtSSCRnQiyVv3hJzQzuNf
	OkNeiZlDNgpcAEAm/e0Gpqy9pMNMbHUa7zPlIOhdckzF2x6VGndq8tjRn8036rliMbl8i/wcfnT
	uJWtxMTCx2MBisZXywKWO8u4o
X-Received: by 2002:a05:620a:4725:b0:934:95d9:85fe with SMTP id af79cd13be357-936d2382755mr1936461885a.3.1786976942674;
        Mon, 17 Aug 2026 07:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:934:95d9:85fe with SMTP id af79cd13be357-936d2382755mr1936458085a.3.1786976942327;
        Mon, 17 Aug 2026 07:29:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8530d3bsm829709a12.10.2026.08.17.07.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:29:01 -0700 (PDT)
Message-ID: <bb0be682-c3a4-4669-89af-94a9c2653177@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:28:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] power: supply: qcom_smbx: include base when petting
 watchdog
To: robin@snyders.xyz, Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        stable@vger.kernel.org
References: <20260812-qcom-smbx-fixes-v1-0-eb48246be599@snyders.xyz>
 <20260812-qcom-smbx-fixes-v1-1-eb48246be599@snyders.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-qcom-smbx-fixes-v1-1-eb48246be599@snyders.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a831aaf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OsHF4jKAAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4rSUyN2hDD0KhXNsd_QA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=aAwnOj5LE8VeXseigifb:22
X-Proofpoint-GUID: 24bx1hUY4r-rzf85XAIiNlamHu0Q55P7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX8hnLzAGHGze8
 vMXu02bz0R/Xg8OST8Jsa0m5TkR7OWWymeAEAjWxmQz9xW4kKpJ60r8+u1mrXurXc3NLiuIswvF
 SX3PAKHBYoilHcA6sd/6fABOMeDqMUtfdifaHZj86NJ1SnpEYYIrTvLU8r4ENLxCPWfN0hi6mAK
 YpEHNNYMDJWQ0B7LnIXW5xSRgciDF4Qy7lzeAerraNdazj5kUxQAGKTCKBlx7ikWgYD3bdbZ00q
 t0WqJMBX9/yiT8j0d7PzncbzIuMQn+LVqhZPwnqr5QLXrkSyWy6B5gxcYz3ElcgIO9xweO+bict
 tkIEbTm/U8MXYUqxZj7EP1wVtrinkxJibd1i5O768lbf5KDTkgzizYw/RIwO/aPAJTga4BuoKOf
 QEkG4KOmWbw1JeRBM4OZVB+U6O7bKgOavVjeAZ9V9LCNTLX8bqrllIJiHebfKxSjoz/KupfNLiv
 gTeaHue+cJSQf4Ee8tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfXyQvpe9mYoU3J
 TG7v+fVjTAXlggpjdL+LvQR8OxmDDFNoDQSnUosg69sYEYdf7OX45NOIqUymRUd6zIjkz6mpHMg
 tnNamtkVwzcT9c+7RRmVjsa3viJzAsk=
X-Proofpoint-ORIG-GUID: 24bx1hUY4r-rzf85XAIiNlamHu0Q55P7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170111

On 8/12/26 1:29 AM, Robin Snyders via B4 Relay wrote:
> From: Robin Snyders <robin@snyders.xyz>
> 
> BARK_BITE_WDOG_PET is an offset from the charger peripheral base, but
> the watchdog bark handler writes it as an absolute SPMI address. This can
> write another PMIC peripheral and leave the charger watchdog unserviced.
> 
> Add the charger base, as all other qcom_smbx register accesses do.
> 
> Fixes: 8648aeb5d7b7 ("power: supply: add Qualcomm PMI8998 SMB2 Charger driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

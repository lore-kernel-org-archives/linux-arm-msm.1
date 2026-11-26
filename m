Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703404;
	b=G+qR+14QKgnCYf2mA3nbBZw/7+kHZb9AioGp2Mq8qJFRei1hORw9nLtEJuypnIBZShIj
	 3jl/OzPmt13KWh+yvr4rw7n6KqMnDGDUAhJDXPgTM112gtgRoDl/f2K3fyO2Abh0ctRXc
	 DjB/ZF2ogVZ5XSHEcWgQNk3ccGkavvNynHwLun0k4WHWALn9WBIRZOWnlE1HcpekmvckR
	 B7u3bcjGx6hR9VO8GpuKA5HMsgd5c7JRTTX4HqQQ7zZYyachJm7pt2SlXczKmwGBgXfSx
	 kVseIZl4u/p2MJFinTAe1m+dETmPVOOE1iSA89xKJGeYDmoMmAIUOROfuK1V8zNZ7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
	b=rEh2lEDxO8XA0LkC7g5Ve8JAw9qHMfESX98Y7jw8Yl7U7EJb45lX4PFVeeYGyiiMD6Mt
	 jxlJT1a3fLczXh8l3JZ3LAli9TOnaSmM0RrhvDlDGTgyI2jttgiutWZW/EKLsMQL2mTvC
	 dlpP+6cyDwHUm+K5JtOVi3sB/rvsTi5BnoE8+D5GROglSgLKhuK/XMqxygHYczIfcB7ty
	 v3Bn2WGjSXj0cGXvhoSBWtkeUyI9+ZcF2YE1Gvn7weaCjf8h1inrtC7LCDfYYOVMUDaZi
	 O0/Qy3F1fU92gKlwj5m2rT4urIF/IvBGiqYpwcqGOAw7LS/ZS1z77ERiPQ8Iy2VcD6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A6606A698
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0A6606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVSLs2785126
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=; b=fLQJCho7UC8UCfin
	bajE0cFg1J/8Pw3XuXRvnKPdu7FNMrJG5Crue6GGgTXll1dlK3SyvSOE4Esg+BZi
	/1pIR82MvIbclgjYxvznLpFJj6GpU+/1Z4PXPwQT7mC6w5tWNIn7dao2jZ7VNXyR
	JW45x/4cFUDDYvCOoJKvuzdZrTmCCfwMN6Xv3P175H9n7UShF0BVTCCpmJaQn4uD
	Zac3qSfe+cS4JAmkMGlCIyGK9i0PUpG1wM4j9VfNniLHkKc9bP8/B9tnI1h1qyfc
	33i6SxLCYKSMIZvPgQ5FuM30lm3EGm48p8333M248Iih7dxFtyFENs7077KFkAGx
	yCPMLA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfba2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:30:02 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso2559387a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703402; x=1796308202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=QXWn8OVuCOIu9WD7DSH9yQCOnFipNMk3z3IlqwXuBiGLi3I/ANAZLf876MCv3tB1Ic
         QH9snTgaRGec4Xo5y0wruSIZlIbCflnjZCPwsXavEcrBwm69k6b8d3zaX8yAo0o2Xrb5
         wuG+e1IoCfyG3XY6U/TDpX+E137d1Udc59MG+vMq0Yftlx74/XILXMXFMW0cIjdlTLNG
         E2+D5R64zMTIoy1HSWGkrg04AG5PvsVQFfYJw7RFFr898u/HgH+LJC+48UgzQEFVtQXJ
         G2WFmzc3OqZW3965r39frGMXMp+KKT95bL3zIhp6JUKK8Iw1kBq1b/iA1NVrk/gvptoI
         /pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703402; x=1796308202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=PWSaKWagoTgxuEE3wFxvfrvQ1X3te1v4fqvVBFsVzlkwCCD0kCOjcoWgOG2yH7X3QJ
         U/59QC0r1Hj3neo6NCEfEBf57SiOH+M5JDAQEogqHvo5TScaIcmLEIZy45q/uWlVTUmE
         tpSNogtIcaOwuxPoBjkdewPQbRGdlvxQxS/i5YmNxcpuV3iUVyAwM9sjK/vBK2TIBIBy
         T/l9yULRKMFjpMtUsmZZAZZ8/sMsWatViJ3QSvYeM3D7HLkiNzfFR/F3V4hdGXThslDd
         g8e/ZeM658pX5uWbsCIkLkosMLxoo3MrMHIJZYnXhIis1h+ce1z78zj8juyJGB3bXZaO
         g/mg==
X-Gm-Message-State: APuU4Z+fGsJv78U8SYwTiSBx0+LMoDBPmKKPbS584VfSXxjlu+nJb6J+
	SK9R4J5LyOxYzUcCwqPimc6gPYZQIzMMB0RwOo2ejiqCQgD1vFEgRovzXCMN4V8YJFbKs3jaM1e
	6X/ELYB8ST8tZ4YNROQ4XoYlMru8TXiM41iHmV+HkwypfjWN4/D/pkQSRnYicpBcKVIYz
X-Gm-Gg: AZFdTZcjPlv8Octcg0NbcQdnoMVYdKkL0j7cbPjk8gsEuVEu9kPH1ZxErp6aHmz0x/Q
	5ry8BSMX+awV9vMa+IIm6HEtKZDqCIV+KCpSPaPzORv9j8MeUrBdCqtQJZjGvyLn7x7fB6T5zd+
	wQ4UED4AYYEGT8zbUkdvG3lxnyiJfz9laZpjhRNobIy+slem4cIzXEEjrHOIJ/wtHTcX99SqF/A
	SBby/kT4HBlzlKk5ekJ9/sE/PN8gLN/Iywp3okGceALh6f3ajFQ7jxF9lXARI8E4fsUo9KRrmOo
	f36NX9sMgLm8gi/YRoGcEh8L5mj5qI5l0/CjiTL7JwgwW++eJkKkopf0pXyWVQDH0kjnjx/LAMe
	oTfmPS9ZYLw17mhO1O0MSvg7E1zd/CWnNVWnNL2soqIrpchBOh1tGPe0MUYUAV4Lb6fTG33U=
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000818a34.0.1795703402239;
        Thu, 26 Nov 2026 06:30:02 -0800 (PST)
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000765a34.0.1795703401810;
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm782697166b.33.2026.11.26.06.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Message-ID: <56ac1346-3164-4418-a00a-168323787535@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:29:57 +0100
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
Subject: Re: [PATCH 4/5] drm/msm/adreno: Add speedbins for A660 GPU
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jZCFb_cjwifSMej1R3A-WT9SajrQk8gY
X-Proofpoint-GUID: jZCFb_cjwifSMej1R3A-WT9SajrQk8gY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX/G8+X2FuUVph
 GdskVbojTavsL1OZhzHNXDp1RY1vQU+TkS5kORUbV/Lx+82LURTz+5sIDjCsOrBXgoekUUGmP2I
 2Enc9cRxe8JMGTSDreJ3OgIamWIvB2w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXyKOnk0gTZgmS
 MfKqzfv0jTubxkEUyjJAJ+cLV02LP7IaVD2mU+QMDciWpjEpTpmMKcKYF0by705P8as8qvkvZQ2
 IGnjFXAYOXrvBI0UuTmFqVjVVc4+eI9UjfDev4HFR93K9qz7gcKOjkEZnoGmLOrieI6Snouvnwd
 C9tSKu77PvNwxAtbmUYAMoQgOXCSCZUrbg3o34wrX/1hpAl+P0auE3iCoQddyq6LO3Y0VrJw3aY
 4VsTLZswJ/lldnC+ncWh+hfeLvV9+BF2RsrjeMhVGuEBNSVz7eX8R5uIymB9gcaP25OctXu+r6D
 /fH3iZteUfrzoL9DlXO+h9w6UCtDJvwQHQX4rf/AVDi0yGsv/Jbqw/3iUhCM7IwlS4GkLuMV09J
 AnZXi/3I1vsbLS1iLGGU5pKwQ76543AWHO/Fq7jCJw0TZbS8NoD3G4HnbVkpCDZ3sgz3rwk04wF
 AY655et0baIINaHAq6Q==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b08426b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Tt5JBQAfAAAA:8 a=LR9blauW7GWGG1yPYK4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU comes in speed bins, read from QFPROM 0x17b bits 7:5.
> Qualcomm's GPU tables for this SoC give:
> 
>   fuse 1, 3:     up to 900 MHz
>   fuse 0, 5, 7:  up to 840 MHz
>   fuse 4:        up to 738 MHz

I only see at most 2 bins, what's your source?

Konrad

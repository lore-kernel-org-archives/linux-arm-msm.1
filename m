Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100446;
	b=PEpJ/bLG2Vy/XnLfWX67t+xmG5QYMdNuUUExwS0dDywpq0VmePRD2V75JL+O6QQzFbhi
	 wRVXHm58oYTYfGoaoXtzqlmgY0lq/wpT9xogxlNQxJdzuSNN2sSi8cNOx3B9jEI+JCnNH
	 5PJNqFtF7HZzCjGKXZEhL9zs3Pd8KKxXKfSbjK6leKtHN85uNDZmghg5301Z5Ql2c+xP9
	 zokNrkxVeAhCofQ9emM2IMSYe8ADwrw8WsEU+JJn3c/FO11AbGTYKWa7oAlxccKL4KpWw
	 COR+UUOJo1HaS0pyBwaZWRMs6bx++H3SUprYTHCpkOLeZDJbEARq8vnVQvYDUBDfq1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
	b=nSKh2WSbpcI15dGy6NFRj0VQRTKSgow1joabDlB0U4spKGZ4E9kl4LlLJ+fB8hGNgZqG
	 kd0hh5wtgSIuzQ2M5XpQXYQ7cwl0xLU5InU1hB3LOMhex93pN3QlWonXXC2OTofVCXGG9
	 2gGGQhwIoP645GHrZfc5axuzJnLE/zRwTBbNovqiH08QC/fzV9i9isVx66AWPF1IBXYtf
	 2hbuLSij4vZC2qMy/856SkbZEeSNwZRDov23lFrJny1iAkx9nmVzU1EY3YUV7r7p1VrIC
	 DZilI9hQ2RTPpm51B8FquLeChZqGv8m6Jw7NeVSDRZl9d1kBqRH/jb52lFFZ8PvZFrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351E8606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3Es1935897
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=; b=HQUiwcNlg3brz6ri
	CV15WQafTLx7qjzv19G0UAoz/qk2r/MrDavXXCnMxcAaO6l9GH68gIhEPU8Ariy4
	Kfm0SlIfx7UmWB0O1wT6NKRj6qeS6tjn7jplPrNtWU1sLINM0qZSuJD1SuUhcD+n
	qNSiiMEUqB7cwNBlIm9dV0tcS+aLWuyY/FCCH1gbwHL8L1HNhXT8YNSjRzFBMsdt
	Ve/QXtL7pEHxwP24JQnSi46obVFXcJV40d8N396wQakDynE1mlpe2gn9uIbsyy6w
	gqHlsNBvBdTNZaILenXEc3tkoDvmdCisPh+wboCxl44jWxWPLDIdr9gZ0etZZR5y
	H3YCfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtk2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:27:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso103230185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100444; x=1793705244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=Tsi00V0inv16cHYyKsAxpXLniTD6HzgR3hWjUxk2/qPQXdln1BFzsygGArWN9DfM6x
         +3yI0sau2mlWbkhSLgcHmK2t8gHaqldcCe4kBHZGpZ23BondUZ/Kdz1L3CW9ZNKMTLVe
         YTmRXeiocUVFYKIDYdLbl9CNslnoeOsYGdXoPbAcEz/9Anoym8yrtD4eGz94yNguPb3P
         7l7gVwTCcy3D1YXTnlSnDkhTn/5lh3d/xnVVbOhp7SYEWAO5vcSbUd+tZWlvyO2GM+NK
         WmbXNJ8Q37b7+5bjbHZaUUkIvMOomoNetUTGALnIBMWtyNTfSiEG+FCYhfWrNqf32hLo
         XqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100444; x=1793705244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=0WByyEC/BPRPupHASv7E/nH5gIoTY4xP8SINly074+vOE8EJ+1D0hr9auKZc0uuW3j
         KQosJEDsppzyRGgEdH5xJokS7E84BVtvwhCjuV5zCBHyCY9DWUP2qAQ+EqeWgrsTAy35
         lk957evYEhpWYftdr4KkVBh7L82FImA6BJurj/rVeI835XMxKwsVg9IQWRf97QziBEXl
         9jg9Dh5+ErWcoulOQvapasvIcUbnhgqn1XbphBtIDHzQ/HGxXzNKn2Qfnch6dWmK/gWS
         zHIMSipUIIEByt1nEPb9jGfdHP8SBEQzFMwubzya136PF6sISwSBSUeREZkWiy2wMbH5
         z+7Q==
X-Gm-Message-State: AFq9FYJs5sHT032/m4xH+GZ2j41TVQZf+FXKnCfd9H6ECNmesGEGsq2J
	2o39mPNvt1ZqEp0UdK/LluSefiBaicFfR7/LsjzaANsJUOnmkLEQ3Pwsb+wn8AZ1Lo0CYDA5YxU
	wkRCNvIrTW9lX6OQMIFtpvMDp6ceiLMRvcsA70OElSqMTVJSC5bEk/X+phrop1Dk7o6Oy
X-Gm-Gg: AYBFou1q0hKOaTyqT4g5bfQehq/9kugwiLGWf+RNKBFrAnxGenU8SpSXXiEKLM7pE/T
	9X5MYkAg7GQJdUaZSkVdsrNyJsTJJ1tyQ/gEXKrojPeHzsq/SgxKHZxRlBrP5ib86N7AN1JFdnV
	MtNOLIHb4OmaTzD7mtXIaVXevuvexAE829t8lUb4ldAKOeqHnO4sfWAOFFt6dKtVP5OAwTZh/b4
	vIYdB1Dvb4P/RLhdIHf4ngoB+FIR3VPGP4g9FdU7xsG9kIrKMx1/irx1W2Llko9G5zFX62DmFxF
	1F63KaUovK4b5tuvccg/vUO7Bz+DimEa9I25ph5LV6WeMDYYA8lWvS0fFU2JlizZF0AZDUV7fgs
	xpUFkNI68mBBoovAXH5EHCw==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762507785a.6.1793100444271;
        Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762502685a.6.1793100443839;
        Tue, 27 Oct 2026 04:27:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4946374a12.16.2026.10.27.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:27:22 -0700 (PDT)
Message-ID: <7ce4f890-8850-4217-89e8-cbda80b2a5f6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:27:19 +0100
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
Subject: Re: [PATCH v4 5/5] drm/msm/a6xx: Protect the 0x1c800-0x1e7ff GMU
 range on A620 and A650
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vm4soniWrk7031AVdqYr8VuExKjwRqf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6hyQ8jx+d7LU
 lGnPGmXwD2vKaKm4+W5bIV6pkgGyZPzA+ZNJgTTuH/gBkSlVTqER4nMwRRYISdjHFPOSwicJ8Be
 MNOCOcMuvUQeI1u+HdXm+HUlzvHtyJs=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08a9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=Tm8wa4UmF2Ix6aBE:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-zc-H5WaXjtm9W6SF9YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Vm4soniWrk7031AVdqYr8VuExKjwRqf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9YNkpbtM8WWs
 ZMR8X8AJHFQDa2dxX9jt5TaS6wFNtHw43ucZcDu5P370BDHodUCsI6yX+diG9bQUg1aYfiMt8Je
 m16HQm8nuL/UP9KTohCOTLQpGlkT42rBWChb3UmSqCgA6FX4JntJUM5PHhEbXbqKMpPS9hk2JgX
 zu6Nc1y0cEDSiZ9P98LrMzQ4x1HIfQ9HCHV4NWLG/QK3Ks0gKXE8HZC4uISS8vRg3AWpVCGCvnc
 t/xTpiYKP/BtNwmCX0keIjQo9qBiukH8maq27ok6KpqBKuK5vf9xCN/KfmHYT1+EeVGGTMYZbsf
 rRGRmZLw6NDObNfWQsFO7GiBxcCVAJktVhoKqiMWHmQgzwtWNJKBx5xFSkoan0j3c17Eeb3w8d4
 zNGyYdo2cZzvphH2hNRQGJ0/Asq3J/4Kx/IwqSu5St4KaTbp5P8POJhlzM1mBMvxxmvFzXoDI22
 Kuzg01wGiXgO8UUZwnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> No protect entry covers the range from 0x1c800 to 0x1e7ff: the entry
> at 0x1a800 ends at 0x1c7ff and the next one starts at 0x1f400. The range
> holds GMU registers, among them GMU_NMI_CONTROL_STATUS (0x1cbf0),
> GMU_BOOT_SLUMBER_OPTION (0x1cbf8), the GX and MX vote indexes (0x1cbf9,
> 0x1cbfa), the DCVS option, setting and return registers (0x1cbfc to
> 0x1cbff) and GMU_CORE_FW_VERSION (0x1d3f8), see a6xx_gmu.xml.
> 
> Add the range as no read/write to the A650 protect list, which A620 and
> A650 share, so that these registers are reserved as well. This follows
> Konrad Dybcio's suggestion; the downstream kgsl protect table of the
> OnePlus Nord (a620_protected_regs) has no entry for this range, so there
> is no downstream reference for it.
> 
> The list is also used by A621, A623, A702 and A704, which I could not
> test. Tested on A620 only (OnePlus Nord, a 7.3 based tree): a Vulkan
> workload ran across GPU frequency changes without protect, fault or GMU
> errors. A write into the range being rejected was not tested.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

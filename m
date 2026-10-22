Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660054;
	b=4IdcxLCBYP2yNVeOdSikMPOWHc78UpMyaA/ZSz5dkKA5NpaHGyYZ2XE8F+9gDaTyb/Nl
	 Lx5i3d7RWFQmbuWMKSlTzWI2oVmiQyQ1jkz9EhHe+OB1GK197u1kIuAaK2cHjTv6DdTCJ
	 3+TL50Mfcykan+kDwa+EH9+BMHbXRKW8ez+vYuiHRVm/ERIf611Etb0WzdFsxU9p12zcG
	 8/gpB7DjWqn7qUuXP/OieG6lTvEoDjRX/+OplYudXboOm372E8g9VnvM9A0Y0jeC5ugr4
	 woW3vsznZ60Wsc3nH913KgSuVvtq9v6/hEv0pJgMARCkuY9mBsxMR/LrI+YRxXVLgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
	b=4to0pzA5wOoyIO3/glagoqHXiboJaRJWozxYQX3GEXzh4LIjIchfVjs7O0aHizlNeCND
	 r09KiJbttckgIRBRzXqqXPHceozapLwGU0qLstSN2eH7CPKcuqJodKrwB+bTnDwGT4yxL
	 gvE4TO+J6jdctYhoVkwMkr1NcYvX7VgYIDaohi6dNS19PAzsf5W4sAcOOL1DhYKvsqwm2
	 4YbifMmK3Wspu0trG9m4lxQ58CC6csvpT4s9GT4tNHpEHdjg1SZOliFUSYa/zs//78vgB
	 rrT/XfZJVDGmMB8Ap/gdKu4OmrQWJaGLJUSKNenx8YNSxzd84S8XZ92ILKpvYPsy3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD16606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD16606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Fre2516207
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=; b=M586mBLx+FD4X+tG
	R2Mk1TD2JkV2EZL8yi89fwMORGIse03JH2vFQSH9fImFtbxrK1C4QJDwi8c7EW7z
	HkKrxUS/8pFuTFkbNYrBO7PTzp1TJFJqN85FeTZVtkLBr8r4OCyAwIPSz6sahtEm
	KK5qXqiGl5dE0Voj0KEydZ5cVu/D+FUa8o2toyysfRgvw7Ma8HpH7q4oQYFQoRxC
	zR7m4j/DMD+wGONv4fxhG7KJlDpnG08roqKcj4ZDhUZiMWCHbtmGxf966hYrUGwl
	pQ/S8ITwYeRR/1CzVPPPk5LtucaHCebknQr2I2QgKLKapzQx6ACNEnR8GggRm8mu
	lduQGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9mc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so30389085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660052; x=1793264852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=LfhM2e6RtHdQ0f+DWGwJRSFel2MsfAdRpUu0ZzFipI2hKsOfTXGcV5fUy6ZFlwnhjb
         F/DqiZ7bpJm41DiVto9Wm0gkZ6vZEwiVJQECQxob1BVqA5Lr334hkGd//OQcJpbP7x1+
         aS+eY7LWk1Yd5Ai5jjdIDClLlb51XWShMTa1lOuD/8JfnDijykR35/rgIkA9Re2/0KY4
         CsL/VABoP/ac8skzcSNmjwVCXuphy1noGZfEgUw7ILEejxuEgaMR3NFF7RwuDLTl7Z2m
         fwainCJXQjbYY26ujCbRjQStJ01el830G+SbW2tkxXVNznqvcQgSVcf2lB+0r8EoEP8U
         KktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660052; x=1793264852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=q4CqQFpjqoRiCouG+V01N626Dr+hd6j1sxsoUkKolAoyrSw6dvZxhx+aCiTYFHfXRU
         k3caY4VsaGrIguZmW/Ifcm9UZtRDPxBiFLranmzoq0hPmdfHbCF4LRGciTW08YrsFvZA
         9AW+qGsjBWD6Jn6wAPkUz50Nu/3RcLX19F+lSCD+u9krP0+aDyc/sNG8FPTXzmYvzLVL
         IcwyzYwrsn+gDIcMBXQLmOab8/vJZgu6j6os7se8pSKglgm2Hj0GymdzZ2QcCRvRlLff
         0wdHS/m5qd/VPz2MMeSkARxecjv1J3sIj7brZVvoPyAMjtsoxNNB7m1ZpaFwsl2JbNX1
         RmbA==
X-Gm-Message-State: AFq9FYKtHFX0hT/3LRVmuWT2Fm78I31FLoLb6wzo33G4yWXn3EykI4WM
	WZLf0oWRvFRTo39aruBFoFxz7ITb2XIWkjBnV2XJljsJGw48qT3X/wjanDyMoMdw2OGvxb1HJRC
	cXq2PfAvm404vnmTBEIUZSEbQtLI4tXUNW7vXgYzHUNXI6LOlLChl4bo+b7n2lpw+p65E
X-Gm-Gg: AYBFou1XEZ5IwD0qMedWjW3hhHhVBFE+6iKfwONge5VwgwSJ6CmcIjSmu3D/zLW21mG
	lWiOJQgS36FAYmSGekvcMWNq2zdeJA9doOxhBxtIq1mfZ9iRx6D4tJHf4I+1Oss/SHxJG4PVv+D
	o7NmjHHHikfJhXl/BGzmX7bxfH+TDSXcANNSDjGghNHQDq7wgfJ6CPdEtleb+Rz81Cjwh7sQNPP
	aonip5dwOzfjSRUI1RoSalhyGwXJWUAkGTVec10Subfl/CLw9jzHkJo6QGvcyD2a/s7w0410lDA
	+q+Pn6rV08oqmyZxFFFZowFO1tYekPAAkzZYSpNWuDiF0nx+80Eifx015EAFdTQaB4/74RfGD2D
	/OiDaaaVuJ5w1wBcgWaCHBQ==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017574885a.4.1792660052311;
        Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017570185a.4.1792660051883;
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ffb2sm81973866b.38.2026.10.22.02.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Message-ID: <aa18ce17-4169-4f3e-8e25-c088c69db0c5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:27 +0200
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
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d255 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YDUdIes_syoG-XcJBr4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Sn2Oiqc4jTR2uz4d2Ym-kxHcBibadWKD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9j+qMQnOnCuG
 3l41lSyTi/64W8sRrhLl40UGA98Yv+HmtHBhSuFFSpQ4NGC3vyAHq+JnwR8gfK+GnQpKyeaR6pV
 upSO7+il49RXu0CBtpvMnoEoR9/4YF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX4vKxRhzUoRXi
 RVAhB1IwlSLHEiKUOkGWUGVkH3GUHohK2q+S6JqjObMQkO756zQ79tXET4XOS358egDm5L4T7vz
 +JJOR4a727nZNvbrhRAMmNLSfwwiaHp2bFksr4PGfneYUK2SpFTvsYC8lv0N8dFMq8SuoXCVcfs
 +Cyb92HyP+6kR3sGPm1YbUlkGfuVGZe1J9RRsw7bKyEciWSZUGY6pYlimocGtwLdMZ2epilKxMy
 hPVVBqb+rnHqzLBo+bMek6YhkkzyU9/ClArC/9jb3Av0uxax2deh7mQ9maMOtjqujpYrUY1YCzf
 sUd0LtLQ4uZvwBkKH5wsnK8/t7fdB7rOcGmV8d3sIeY/wVBUCaa2mc8pTHLFcb1zC1Md8tV2pAa
 +cYJ6n581n4OC+PswhpYvZvPkrunIuqOvNtdUWL+8x27LJyAl11lp6d04QpnDL6ZvjZjfExTcdT
 32tOVr2uj3c8VEJQZHA==
X-Proofpoint-GUID: Sn2Oiqc4jTR2uz4d2Ym-kxHcBibadWKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

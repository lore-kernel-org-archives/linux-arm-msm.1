Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269405;
	b=3HrIrLDEkZLyzDniev2N4xnvCxwFWE1G8JYWAsP0scEWARw9ARUbWYThmk9PSIkx8dqr
	 tb6qNwcIgEtzi1n729IcJZSHko9535kh3nDF5pn8rfK03wz8BtSdmGcy+EgS7RandUeX2
	 hOKP9TGS/yQH0JKUh+Rn8FdNgXl71YgpBrrws/8M982o2F4jN29CGl6NdRwv0evttOn/9
	 x8A1SeQJYCDSUWimbQWh4XBz6BDmHWg30tjg2Jn4ymULKXbPq3bhFja0aIsRD8XZinqqt
	 xxfGJLjV8xZn75Z1xyKr+KOlTYUqQzqYJbj7in6i3/ZDEBPJzI5fMo/i22yA6ZDIusQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
	b=iUMS9YSVgisjohzARLA790PgOrACxQykHiJuEET1xp6mPqLXebKpvFjENZi1Z+K8GFJV
	 CPPrjzCL65lu2wru1Gx1f5qj482+uRb8FOS7+iXaKW4or0skDiGNuRZAq+1d+b0L0yqrc
	 pjTzD6PlcbYXvsa5C7fkZVeHUVWxr7oc1kz7FcpUt1Z6SRQ9S1b2jLiMKw37nkHz2Qgm6
	 G4QiESHbLbgHz26hRTB635o1aNWCvfY5qpLlqwexYAET2q0S1w95wm8pR2NOBsqiI8kHL
	 UIgGeW4pbAWvztu9PRntu/9mbPUruUs5nz7Ly9Whn4286pQAo1i9qAS1+2bF17d44dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1210606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1210606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFnZ3765970
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ha3fj/COMHQz5CNWaubKxJEo
	CG8ElfvHahMKU0w0GYA=; b=Zm32UblwrpFNdJzdB69DOZIKQdTau7hMM+lmAp8N
	cJqczZeK3MXWDjsMs/sjcArdqDErxtMVpFRxP+RvIb8k/EwuKejzg1JVOM66N0nj
	cbnGQqPEh6cTy3RutZq3HJdxyd+Z6MyB0+C5FirG89nUuSym1y8msLtvUFlKnr27
	kaVSncyxq4GMcY6K+Qyw4PXer81E7AMnLo5sMM2e4XYzGAbKm1TlYqCJbUr0v6MJ
	pIK48p5sEVR+Q67V2+qmy2uEC0m+JQwe9lHbm7E5AnReEJugdazjtXaUgkLyYtpE
	9E1oZWtf/KqWF6O30IIaDZyh4q0snx72PcIhxhE4IUbvzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpu4ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5383c05fb2fso23025321cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269403; x=1793874203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=YGMZJ8OUFPxKCWqSPM0Oyxm9UjjArWy63XAPVkrOzX4bSG8GiVGSbw7ebueswqP0xG
         yHVUv4zlCrVaPZ7ke/uTcBzS6/5g3ww3Z4vbx4u4cdrV7dE2/fdDd3l6ZlT3l14gkfZi
         IZqAuo9Vmao1eN2zdiFJlO49qjV3G8szocpTzRqrmlhgZGvGhmpJ6yrABHLQbYWQpFPw
         BtHUV5GvWXhYe1JEvzH+obREWd9X9UD8b+D2VLK9PF3pIzieVDipY8DeCglLRWGVKOig
         tlBS851tPk4E76f9TyXbYNkOqtxGePGqmVqpPPq2uisBUM62F37ePQKQ9ueA8AA/IxRi
         lQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269403; x=1793874203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=L+JqC71RpLmMdu9jk+ckufl0di7nII3PRQv37p3A48n/7ujtxZ0gIAJdZ7YRsvHKuD
         LIZm9u0hbzUH8Ag0R0ykS7CJ3jsPngPy6DSJT0DdO8jCWZFV2LGSODiuEIlLKyjHM1Ti
         xiH62gNy0gFhH5PUn897hIBq7VKwX/HLBChYIwUc+Ofuvme9cPfFrd2WjK9eyy1zTP/e
         qwjfZNBx5VKyNxWOPbj0bwiv4C5GkDR7eELxyoUFz1iz5k6xqfw1LHymSM0WlRqBvOaI
         J9mVtW8KrlGf+nM+QZQfK+hbF+38k6fuLjsq/vHavrpDv/b6SG7hA/VP3jmL/yn2xDMM
         XeKA==
X-Forwarded-Encrypted: i=1; AKwUvBw21yKjTNURpIX43IjaBNn8xMZvbW4o74qNQ3l2IGiHC9eiy0C8b3hE+e0kF9XBsGI1C63c/dznE1hleq42@vger.kernel.org
X-Gm-Message-State: AFq9FYIql3y9dMR7vWyy9jrHq3Yh1EfqeNAKcbOQCQjP/fCjIeeFTVIz
	gKtuRvRTDoRnKF4l8/JR94D7usUdWkBDgX5a0nz5n7an5I+WkpWzReJL6XbZb7YIWqKLdGQiOyl
	o9qH+lAxHWKFxWoFOEz1rVwK50kHQprZPOWrH2Y8q+7jUUFvDHh+WIxzToRfpVfFV+jI6
X-Gm-Gg: AYBFou3Lgc4j1kGRBns0KoGs0Fn/r6Ch+u61iVg8FFNN8Y0XWcgE9vySqcy2BfiX/zw
	RyBn8xQ6lpQtKCS6tVrO7Ixds5ure1RRhSFV++UMwGXMC6/b3EQRRTawaImk2c98LOfVc1ul+T6
	/t85ETTVYX9ZNO8njKQVDN1sVpdzM8ADCsRUKi9dRR5KNS+6et67bvZHVrOg39qFWSwRzFlx9QP
	tKHSpYqpGecoVUjxSpu1CmKF5WOuzC417er22LXZUwxB17+Fqt+hOsk/PScZxHQtN63lOpU42va
	RD2og8JFyEW1h4mh6XMPhX8knfR5+6ARBfuLpmiaVtw05z47TxEws+mHluhTvyxu8OjNyKk+KO/
	/WsnT2lF29VNiYjaSTrfqO9etL61ctrCAjn7SwwE34rbUISXatn2MdS1lbqj22dCD
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736630185a.0.1793269402901;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736624485a.0.1793269402246;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33494130f8f.54.2026.10.29.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Message-ID: <sh3b7m43aw5wtrolooxsib3rus6br4rao6wtnc267rczqysyis@75voym3v7emf>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX8ZPnfdaihmBY
 /QdTiJdqvuDMyeOEgLmDO6AKgNUXd1+t8mvQi+HAI8HHyDXbTvrKq6n0alyfysyNuxtKjx5aei4
 fwwbHFPnzAorvzo90aA9QHECN5PKRzYhsf8n2S3edUuWDwzSNypgQCwrsXzqrdAeMSYdtxOy2vQ
 SA6lLci/jFLu/o+itvesU37gq9EnvbO+tJDBQx/m1x4kwaHcwVvl1Qj7csdCETOB2DDbNsacrN7
 xrMFv+9CdrIoiFbZHgzDZGtTaDeUF0KkDCHD4zcBsz3hm3nVP4rHCGWV92gaXzY16ZPffHNcDfw
 V9PiWc5KdkHx8q4axSWLhbDPRHXklmQ2WI7sAtK4y3ffhp28KMFnX4q5kSPTQHX8zUEuxY8cIS/
 hBkOnPCZnmV4zLmMq1mo/O+H2IxZElWa211SstQNjFi1b0RV9/yHxeZnouYAE+64kc3OiNGnuNg
 N2FNURRAZ8+4/GjVjzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX+oM3pfa1yE6w
 eRindVFpxROH7YmPqCGOdn1aMMENHcaCUYngY+Th0Vw7oZzuRPc7KP54V8E00ZCVxeggiYOUG8O
 ruy9OdL5Obh1G6YFkmuRJ1VavT4EhyI=
X-Proofpoint-ORIG-GUID: tpj1417uI_wBIH9hwPT5lEitJlMqZoYH
X-Proofpoint-GUID: tpj1417uI_wBIH9hwPT5lEitJlMqZoYH
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae31e9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XpayGGiaTZdiRO3YngYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040

On 26-10-29 14:31:01, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

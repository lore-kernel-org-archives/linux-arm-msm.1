Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B206494826
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992256; cv=none; b=ItmiqM0PXCJ9KJ5II77Tl0lUZ2FjNUsUYViD6btjqNrRea4z61hxc5Yu39NApcA/AQFBpU9UpGnH1LWMiN5l1CDQt9LYktdQOtzjyuuTU9OPryc52uopCYGf9aXYXhylE80lBn5IhyQlqvsUrIvcb2M7uVy05+L0cXDvDUEjeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992256; c=relaxed/simple;
	bh=XRcFq7IuXH9kC8tr1NldVZmFxCs4PttO+0bLD5IWDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6T/GQZOAFnCdwuQLX560gwIMronIh3TN5VYNQwwCDoMizmE4xlKWvpuzQ7G8Um+398ltYIjtgDTYf4xZkmmAdHIdUfw4MKHtp/KERyidb1891fR7hK8meOLe88kqrIcMAWD/Sh32x9quDXPns+ki9zy2heGiuSENbjLIWVQ3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6isgjoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C03+e1qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6isgjoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C03+e1qc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdqD51217759
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enveY9jv1nThYF2kaQKkUFzj
	DWdSqrtaseNwSFGaCr4=; b=U6isgjoZweeTIfcGZSSS8o3qu5QGVnoDKVHcKiWU
	u8kwH7nSD18DNNuBZqbCiGyq6/lTRhZa4Wu+O3Fo7ECF3BWs4PvTBBTmzSAIOGVN
	bTZ6AFddbVXCejQnGWxk7RkPrOJ+fL4Nd8Iaaqi7yKylPY7m7fJpOzyouMfzQwi7
	7ujrCc1SgVZ+pmZa01znPs3/bM+nko9Wrwi0YBMSxAqw15RpSu2kV4GbJr8IChQX
	t4GcNBE8oaxeF4RqGXkFPt2YF/9ydAnLQzA7QN1McnpSBw8yUo7M0nNSm+CeeQ0p
	Gq0CL5pyEFJTdBobBRSZvzpb18Zy29W0+zbTC4rvEJL0Ew==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01194rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:04:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f4d6af128so867073137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992251; x=1790597051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=C03+e1qcPnnSqqxLOANSQaQhtikgxGMka6/FfHPvbCpWzObc1nWOBmWU0d3LkbpTSk
         8p0d4ceparkYAT7PX3hbNnTA0npLddQNBwTf+xtvs7CSjAIUV0Lq9V5g61lWHgz/FThr
         /NwdBCd9Cd/PODWypGLDrtZ/zDeo34LLd+7GpYsTUzEqVagcAqRU8R+DswYUog7kwhJU
         LY3XOBzEWPFNvo1822Hnkg/PRFKffBqykURn71YSemceNaX03OqsiPajmCZBnNoZHxVF
         J2+VEHipXKNHryU2CaZ8/Nclt1kDiwfZMba+cJCLUKYBENcWlqc1vB58naB7hN1ceuSW
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992251; x=1790597051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=gBAIM2LcogeqXVdvlG5yaHm4j7d+lV/jXcnXraR5pneqKtcq5YVwU3iQOGSyEMuVn3
         AhIDz93zL/dGDmXHtRhfXjNAyEgP6WqBelc0yGqUZipMS2l0k4q3d1JMl4y2qgMqUnfr
         2OXO+Us/s1rYS39pG7vtUOP35ywYbzjkAbl/tR5Uce9nBFAOSxi/Xn/UgjaAOg18I/HG
         mQe9b8EqrzVIP/ThffVUBq/6E2YPjDEKlDd3HEiu+U7kd5faYYMxjhMZLf//HwXPL+DP
         06IdzSQwB5Rp/v0YnRcK80vIi7NYW+sqRf9iMjq7j2aptlqHQ33tOHRDgNvqxgzlp/E8
         p4DA==
X-Forwarded-Encrypted: i=1; AKwUvBwdM4k0SIKHC0GwMZFYyADHmRoqjoaegEzjynECXIA5bi2K4Z0BuKhOhkSv3wQwZR0iK5Ud30/WKYBnXx1O@vger.kernel.org
X-Gm-Message-State: AFuF++mtKJK4PxS5LFAfLxVCBgvufCzBhqc+ALqRTsa/nrNxCf5Fs/de
	N5hMfzj1X2qcBYSYz2/UsP50G55rKsoK2jTcKAOYlcKFIrqIQPTMJ7gTrrgP/jnK/S7ldmegCdH
	2R7WLOs6TjyJeztpK4RxJVfowYwQ0yX2NTgzyNTx2YkhbPbJefIkN56/uPVgTjW6Quz+6
X-Gm-Gg: AYBFou3xr0SacHQ+sZLJlq+tWR4xthLSedcof3v6G4jZIbn90DrJ0Z/1IYmG2R6rpM6
	SRHz6Vlp3GxrO7K6B7G37dQKqhBt4ZjCuMxOOzhBbcdm+421AKOznFhutjoC3nN528UHiL7DNep
	BACfxpPhgIN1mQ35BEsIzUPQq/WqSGM1gUdVaJ3y2BjLDbLx6rARgqBKNTX8/K0d2yJ9dSbswys
	gte0zbClp19KPEWlmJlJXdWJNo+c4W1O9774ZmbIwLf5cX5oXDqbyq+44Gy+ZgttdU19m1bEJPH
	zsmF8ERMJ80tPfVv2u1PmfCKMcZqKnVBlXgV+/xBOoOEE4Y728vWM+d+b/lIkoqj11RooFVZOP1
	FZ3Mj3XGOUTVJgjo=
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670597137.29.1789992251054;
        Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670527137.29.1789992250513;
        Mon, 21 Sep 2026 05:04:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm245354285e9.1.2026.09.21.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:04:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:04:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Message-ID: <gafrnwlti6ojl3nrifhejf76voamomuthwuikfmbkcot26fe6o@5uzaftq2y5mo>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-GUID: DHG3IZJfFAIUKF-7vJNGdktmoKgr8vzL
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11d3b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhyLHX4QOuxJUOlieskA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX3/Ccm3UBWJMy
 y41tve7wQmDbhVUnvvy1+Joo8+HljnbdX54OMyeBrXl+0D+93r1F5RbXaBa2mrJ61sKpGdGo8iW
 UlzlNkRzqdoFleHNpRMCDeI/fS/53/A3iCjvb280Yl6glYnOxVYCzh+SgVEs1ttUr99pmKQq03i
 I6CvyVFJlyCKlfuiq3QUsY5FDwy7yG365w9PnAX/2jKTo4Om9BG7SsXTW+2tLfVeNQmLP4rss/8
 7TThZJLOu+3FDul1VXSRZu0LG61k2OTor33e+/uYkJ77T8fFa9uvYVplYjuIJbgWErxoZQawqNI
 5YYD+tGqA+ZhB0PZ5jr4K5aYKQIulYRLVDvjxdQfsDMNPhS/zbv5zE1DCCb8quQygmZcafY4VLj
 O8gwq3Uk2aZPUB64JDT5PySb96YI7irx0/UJeK3HWAl7QkwyGewI6mJs1tCvraJqrF8Xoum1AHP
 HU77f1r8qCCcDXOgK8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX4zVrNcDI/hEu
 PHZsUTPt/o0oYWh7wJvAL+WOh/IJf+HdITLy5/fB23PqGRXE02PjjAoahjUp2Ih2J0vnRIz7r5k
 ErcVoWZyNyY2fJiK38Y3e5HhKCRl2zU=
X-Proofpoint-ORIG-GUID: DHG3IZJfFAIUKF-7vJNGdktmoKgr8vzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:39, Kathiravan Thirumoorthy wrote:
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
> can propagate to the USB controller.
> 
> Cc: stable@vger.kernel.org
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

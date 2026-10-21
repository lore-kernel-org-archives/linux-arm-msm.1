Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569140;
	b=BjI4hE8BBQhgZ260B4tnIaQ4y0mCb5+Mx3h6BO3q9ce3dipL1ZsxjD9agrOtayn1ULuj
	 Ktfngg7tWGwKSIwvi6DxwVFdJ0Zuv2k6xgqwUGN8mN+l2wHBlzvNS9iUbK5Vg91qR7O7E
	 XC8O2P2gBvHcpf14oXCHH2+cyKGjwSfKBNu9QEZw38jjCpKeKmgijOyy0eVOxwUQw58yB
	 YuTVCPE6K1Z4f4v3KhWWR7RLdch8ZlOxfGE76TeALVOCuzLXvOycHNudynNCOFcTJtdG7
	 OUWQSrQwc2cEHHjr3SRul2DrtRviELaB3ekorKz7F3ZWe6lPFIzkeMtbY35y6bjxbqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
	b=LTbU6FT3gDc67uTUYTXXXK52jdS8+isKrEiIeClvPYuHu4lJIu9qGHDSR1n7CBL0Ct0W
	 ssFDIkopMjwVD/DSG+7lzJpW3glFSrE0bx2bglG6EKBK9wg8eVeDtGg/R6mC79UTBFXeJ
	 vQh1jE5vW7Qhl3P+phMWtDiQlyRHnwL4mK4uDCF0zvh/bN7EOq85ayoY9KYvfK9/6ejzb
	 VCy8OTEHU4ah88JsQvztF4J6bokcI1WPphLEH9aegnkq/OKoKTOX6SCTgwQupFwfiqJOz
	 gh4qbAbS/fHjdhU582BXEsK32R1xRBVn7NnmGO8IwD87Dgz7VYf9wbKKAxcLuZkZloA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L8oN0M/f";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870F8606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8oN0M/f
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7PvNr4101121
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1rm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13426585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569138; x=1793173938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=L8oN0M/f0SafeWIOOTVJDB5c65jCkCoTZvBfUiRMPlv79Qlp1uSt0PZID56oUNL1Y3
         /mx34q0anqB9jrjPoPoloKUxA0k20/cDdwgL0Wq7DJM9u+RX+2/pJLhnePXMH/x+36Ey
         CJz/wyfjcuQFeC0CNDEv1vFOLLo12nCi1J1D2WtfNEAkfypaHZwosoXmRNCDvxrObGci
         8fUT30fNrmJg2+hc/o61vBMeb8RSGI/fQdv1K2V1NdkGuiveeKRec/pzsA00U1OhfW9/
         YWtK9bOFfof3MH53Ggd1J+jrLBbMSplt19rnpbV7HkzypY5YN8w9GdxuXNc0rtjwkaH/
         bV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569138; x=1793173938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=zWAD6yfAgn4LQlyrOo1Ka0YdwXMiE9s+Vsw8bASyD+IQa/TGowsdHoJtDIibFksuBR
         YuEcNGSVBazHmQiSRfFu0VlrISsBP9he87CkZKGzGiJVMRGNG2bk+vyBODQtmUyodHEV
         aASedx9RX7HgnNbXKZvVJDfZ32H0HnTrQKgconmtQpY6rPIgvLBS49nD6UGdwVx+WMBI
         Av5g28C5Q04ivBZtN5kePN/ffNtXA6koq6zKM4ZU2B+VvFAuVrTMp7QK7clK4mTyG1lL
         s2gWAbzEaCXXC5ni93mDllkxb6JFuRY9DwPzecQhw9tk4WJM1aopaRS5couSeW3EYOL3
         DsWg==
X-Forwarded-Encrypted: i=1; AKwUvBylEO4dhwgYgdqjonR0szGa/epFb+bl69Fhvlxh1woh5RJJovagRzkMSUPO7BW7jVBbU1eO3RTQKfEyqWKO@vger.kernel.org
X-Gm-Message-State: AFq9FYKOd9Fq5RNArH6BxwXwUm52zMP+zDugh8gF61FTAc+vKwmwFP7r
	0GToSRGHsFq6VNwigT/MJAm9Xyvggqwk0yikDiWNU6X+TygDp7fILMj30aHmOw0SUIfbcwFCMYr
	xjlJLBKtw2cxx+yPPpy40sYevrmS6BuEMtuH/Z9ntBb0KcuhWNpyNEU4kBgSGAntSgvKD
X-Gm-Gg: AYBFou36pgRzm/eH3e+9AQWCu0cm5gvGnSMteMVHN8/hovdUyAKBzNMT8U7OC9HDKgH
	0aH3zkUrxqx4qnqaMsTyjoaxf8lf6kiojoEAvi+l9nD3B6JadFxSDqfB4jqPHxFLqwVUOyqmj/G
	lOPYen9ThvOvwXOto82l2qeKHbvVTdKPrhzkCb+it+D2R9nvy+npq86q42T0zIxLrFx05MrIoNS
	Gj2hHjYUih2nisFNdG5HmAiGqFYJHTJXuK7owlDqJ+l9qYPEaAuJ8mnnP27YfM1x1muI9wlHsp9
	V2sr1bDvC5Dk9Ojdjqtr0iExotNLOM9JcyoJ4w5K4IRU26zAMs/hYS9EJ5ju08HDl/u3xWKAOIy
	FHDiUqvGKIrLoM3TE3OVFmA==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23256201cf.1.1792569137646;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
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
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ix_Yk7CBqzBmM_IUBuBWmMAk6-aszoir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX2wKlPClg8j2q
 Q2QfyOIl8Gmrdppkgx/xYf3AEtYjdB0bPbSDk+Qma2HHixgifLCuTJPW+AaGVMxZU4712oovFEO
 Duz6XG1X3/MvaMtaGYwMX+HFYeabqRImfdVPzhNdcyj1bWYl5NyVzcWci359c8jhIIKgZqiGh4Y
 dPuulDLo6Jj0q7Yukr0uJDC2aX959UZuInzARa86LeAy6TF0ImYvUjFCLsO8TcFc8KqoutcnlGD
 cQDkzppd+m1n7H9gPKyHXMBcHSpTWxw7apu7XeTddiLtdGHXJ7uFKihMXigUhyEzZBWE9Ta16yI
 dMt3AzofkFYJ0dww3NTa8DjMi+lwF9FhErsOJHC3TknNM9zwbsVR7cd3WKk7mvpGHzN1TFYIjKi
 UXwJ3IMmaGF8S4/K/Q3qX2L/tOqJNVk30CoJlWo5qDApt83La20ckTEQ1o4avw8eCC9COYCn5J3
 cxiaMBurek1f6Qi4ATw==
X-Proofpoint-GUID: ix_Yk7CBqzBmM_IUBuBWmMAk6-aszoir
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0LkuFTX1753z
 nlGlgEITuGfM7b1ccI/mV+sRVQmHmUjJWvXUc9lJGkxItsLmvlmvRysPU3zL8LYzRKq1y9TwMTW
 e14u7YLQ0H0ozcG7DmnONWepHqAmYFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

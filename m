Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316720;
	b=wlv6PuSdVm10rU6LutovRNF6yFZbsJePXaq4THjh0YCeBusMeHu0gwLDAUPyMRAlkLml
	 ETlVIvRfS+ixmfe9xEILkBObzqNzZRilRImvEmwjr7EyPkyUIgmG6YSFvv1PGdv3SwYXM
	 gTOJI5J5d3A4ZRgUzOJaIRhz68KGUp+HctFw9C4OYaOLGfO9QXvuM4cEzuX1MKlsttNBz
	 V9l+zk+HQq7RbM5c52jVcHP1IkIWRlyn2Lb9ijY73nKeHOaosA8B0VYeRRsRXUZOLJ92L
	 /ncCzYllKJ+Ua6BNcK0CUHjwXd7MU9nyaPsWp9S/R/t5hepGzK9gs+k5voNdCw2HZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
	b=ffLBGCOTQWBW3mc6m8QjqOcIyHMOFP37uaNXHxJuk6BrAyRmwhLBChTamMItSxIy/UKZ
	 P1IwcwsLIgA2XUmuI1n6KW2Us/jSIYrvH+ldGc+KzQDyg6Rhqp4HK4cd41wI4f7AUtE6G
	 jOhEahjqoM0ek5HQ7a2J03Nuhxt2kDW0nSE7T4qdT9aCBOSZY/8f2Y725I6tjqywNZF1G
	 3uSTTJ7YbnBhQlNAt1WBtQotCs27tpRa9QwgiL72oAAfxljeXFjJUAsYXXO3ATw6vrkqT
	 nYSlJxh/CzzRIk8MW3WppwLxtugLFh+GfyZwVd2mm23kzhd+C8wzi32d/FORfI5MrZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F600606B6F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F600606B6F6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA0I52253472
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=; b=XTPfigwtgTvljF3i
	86m27RQrIcd+j5CVW8XsaTKNOo52BhyHmfJqrM3rLjEEC7UZBLagA+73oAuX/x2N
	A1o74BHkFVwZPfJM7w54UBMMV2lFDporMuo4nOecBtOkNv3VYLXhnrV8afoUdzzn
	W8Us1XxdQpXwiAOj5nfcJlTYsLU7OlK/QkDzJI2fKrLzdyoDBUvhur2EcsXlaGbP
	A/eH4fAitC++hP5d0tdXiceO457XGdI92TSBYYc+x/9k6qugFXNGNzQ5KpO/He9R
	9PbCkxFwPeRI5+4HnjjaPHOfqFEmXgojcBtA1f8eYrOhR9a4DJccQLqIDNua+Or6
	aB4Asg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw48xxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so365871485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316718; x=1794921518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=JRqAAsPsdx5yoGq5bEodeAg7/13dkNr3QGrCbZZoraPGDDWRXCVg8V4Dt0nLett8VD
         gYX7RhBDNCORBGMwEAsc/SnOM2QSWyys28r2RRjeyOcStMdCprmMnSCAfZGyVPTkHbdi
         vf0S6KDAr6NylZSdTiozxDLa9lNrAoi8jenwAxhMlVm2LJ6KtZ4QQj/QS8f3NPY4YZEv
         MP6JRps9c9GD8VL0VPJRb/BkUxnK/abzIRSA0HRqkKBVVI2qV4HCk2dGl1Ryhl2GSTaI
         EVuG1hYXVV25fJb/x97WckRa8CNLm4w1TySHHWD0kuaV+FHMomkq0leC64Mc+V20BBwl
         tcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316718; x=1794921518;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=sfDgivWFvUUEAF5Y3AUBYeB5Ik82UD4T1hszDEHMCHCA8pZMLTD+5z/XanQE3xkyGe
         4X4hQDsQ/7pp+adRGDCka7yA1xZR9wcviy5KaZHR1gk6RpTfG00FBU+PHJBChi2Z+1HA
         1mEn88TMoQeQ79YeQg/q6LqmSqVQrZDbizFuACGOHVANI5rSWdMAwyG+q5f410vF1Ign
         owuqTalD2kXAx94DkF7UFYHmXcjqrIR+3eCKYyusXyAOsJHCQGmNVoVuIP9IoCVjDqm6
         ASyaA/ovQzCii9c2tGk3HvdCQ+Nf/AVX3IjJ1odzU38gLHjrfIFuSUfUzLApZRfciIN2
         lfiA==
X-Gm-Message-State: APuU4Z/3BivKmY1Ghdj+eB5EkLRbH1c7FHDIsc313mjQVNeRcDuT2hJh
	e9bl8hCbSgKO6l92G2VzUE7j/Ro/nVsWquu/vKrfAw3RWRJLopk9C4AZeT9kGxZIWeK1NMDPQnh
	XPvglsEBCmCVAbHsPEp7TI/acO1y9foZYE/1D6/HUjsU8fYT3Rnf4/OhR0xKyF3uSap/I
X-Gm-Gg: AYBFou0Yc+qR5AkqmYa1pkZuV/Dm2RffHYgkYoJ+RWt71gKfG5UGHwYArC/QkU/8gPg
	58MvSommLr84IsVREhMDpP/Qb0UPiEmAdyyQxuR5AVTezWJdVWQ8Pu/0hv56Z/MvgBZjac1z7td
	18cJwyWWnFvpNW+xl70rg9zntB4OcJ/hbhkJ7roCec4qa5Fb3e93m4PM9sMOHCfbqmDEKlTLM/O
	48trRxDB/q2sKCNpXBC+2V05IzQIjtQUAbvPc7U1cV/BJmXNLl5xwSSFeKXzCk8JiuTOII0pgqo
	BaXx4xyn/2UFbMch6qstkdxEXULDnVpcwJyzqzBEBGrRjhoHbeTqbjrO58Vj1MQp2eInTEFhH+P
	EpefXEZjhnO5x2HXzECWyDz8Ve9KDgPrFqpdE8DApUEF3/o1y9L+ylmn5P8NCy4IxVRXBIcYSrS
	c=
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423390485a.18.1794316718592;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423383385a.18.1794316718090;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm4995698f8f.31.2026.11.10.05.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:18:37 -0800 (PST)
Message-ID: <7f052309-63b1-40d2-a4e4-29421e46d6c7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:18:34 +0100
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfX+WkxAhJtrY0S
 8rD1yTMZvj8lWlkrUB6OypcCZ4TrgNH1KjddMqxwPJUCH0by/FATsGUpNwQ7CwMh9wGL2tLrEcb
 Yyf9fyOSfQYpHDBAd5IqNHbFyhg2nKXZ8ZAGGu/oDFYZ+zqzomNbzalwH8Ip94dGDK9v1zNhDHS
 jcmXTnqyq8wWvpcDwfVBm4Q66MdaZtvLtUxuZqPD+7Vkv8poolG90skaKxOLDzs5YqCXAezFXjD
 MExEK3ePx7RKLNsGlYmG1NO/9QqBN9luiFeX/wQkafEL7EnjrQEt6B5w/KQ2A+iOgGzQqAI/Odo
 Y0Vov51/0/VDTPH1GPdfs7Fk5XEqFeRuJZ8jh/nx/c4s8M31nblMwaIRowqliEBwuotccpovkD4
 9JoKzc4uO0ldxgCPXKvzfvvLDKAJcL8qPK08XvxSG4bnk8uGXXBrJnJtuftd6GZCS5sOUQrlEmN
 no8MTyNgWDFIvd1bwjQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af319af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=udFPpGrmtiWedX3Zxo8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfXz953xDhXQLx7
 7H4zurL4u67xsAti/vA119MrgHb2bqzZiAEqhs4yAg0zfsohKl/RZXi9MGcFtMI1avxwNwsuDdm
 P0ccDFroI0YswPjXUCe3PC+Vxuu0kNM=
X-Proofpoint-GUID: gwVGS1aMdswGcOZ_15YaKu9ev4Hrl-YG
X-Proofpoint-ORIG-GUID: gwVGS1aMdswGcOZ_15YaKu9ev4Hrl-YG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100052

On 10/11/2026 13:57, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  5 files changed, 28 insertions(+)
> 

Valid Sashiko feedback, I missed apq8016.

Best regards,
Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167963;
	b=RJvpvtUFOT3VLZESNF1CXBeaFDrgipS7cyXvTSuS3e+3iYOL2HiS3GgyQBC89bZVpAD/
	 8nURgz9W84PBSXY5V5tllNGFTxU0uRVEfkw6BTVArDQ2EQt+qkVA4FDkjCTAjcPvVrEmp
	 wrc0DdSMVMPLK3x1YJ9qnDp7djxx79ObVo+VcCpoWI/qus1Scwv3xPTjrPCbwAyFWJAB3
	 skKAtH4R86Ghg809ZTA0cb4UIrpMtBir7zn0vuU1/q0989PoYLFYmbyUtfhOxyoAFssEQ
	 1YIm71HczWIVs4SpzlHphiVv8zKm7CzA4PJ81keBqlwE9uMTPF16Os3rLrD+gYOmJFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
	b=E7++9WIIZ6elesIbLvOuFUh/kD9SDQ0xubC1FfQO40naJW9NZSJ1XRs8DwMMV5JYOPOu
	 oCc0zupLAOT1ZpOXcD3SE6OHJzSSc8z/nr9Z+tGFZvEmwihKY1UwTLKeC+kk0/fY+Murp
	 jGWQS5bWH0FFDMwkglwcwrv/CZrtgPJ3LzdK1hfuPaUMLuqD0n9DeEeUV4jsiFoekqPFR
	 +t8QfZnh3vDJn2XhWWwpGjj2VELKhB1W2ygP2llZKELgJPqNcwvmbqvz/8cpw2vwcWYgg
	 jOgdrPsr8M0vglnoa3iylsa8qHFE4vLpvXopKiSWcJK/iqbPwY6q2i6wtGOibcOTCpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNgUScH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cunAVU4/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C4606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNgUScH/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cunAVU4/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9ZdZJ905557
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMOQyHWGFl1egjU4MIi5naii
	YRrUSwo/0LdsRuAGp8I=; b=kNgUScH/89dEhe5udhgT9SLv2tUYQiSlZO72qVxD
	OaIOrfiaoKU5JiXC6b69czxE59qo2WfjGbKFhkpr5LBypSW9wzLDUmxA8J/uqKFv
	R56Bf83Hqyz4Xy9Kbiy2c9c4X6B+whYiCmcxGDzNWjhYZNfeJElg2FQqRKtsR81J
	Cj1hwKTc60rAPdhQRwLx+oC5KsPUJW/meOtfta6RD0iOg9plL3jt8FKtT9VWmx+3
	U6Zi9r4cFbM+YohbcrVBMx7vO+pvY25yoC4NcJ8n5gbKHFiq3+zGRx8biVmfoxjx
	io/KVPmW+V2MeRz33o1I8zb8EiNHL6eYQT1Izkh9MKtTBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk1fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:46:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so148084285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167960; x=1795772760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=cunAVU4/+qmZSiAgzBMbX/04tZzcwpkGu457bJPjfl8OJHV7EgK9UtKkF31I3yn4AQ
         tNtkYOv0wlV4b62qhei3mdyxcD17pE5TDUgGubERo8nIqRFb+LT0s8zwLDjYyk9gHsiG
         cJZqpKe7QZMlTWvlFCzP37Xxjnr5ZasHG1RdcYWlzteS7R9meUC1Bhxsszi7l/r7YI4K
         lykqij07IeMx2ScYt7R2XBD0MWA9Z/ETaWLiiQdP3qpTGf5AiILNwOMbAnEM3/LerMWL
         JY2NlphNRH79wW5oiWaV/0DL29DC5g1Lb/OhDvtmQMkYPc0NxibgNAsCJDlHA0D/2Pl6
         wDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167960; x=1795772760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=VIwoAYiAAfiJXqd4f8LtN6lcFROoUIk+7inuK6Kqg3PeObLEq5eD/RGfZg4I2ueKe0
         keooBr2d9u2BxGGKZsJwAaMbnqN/ul5UFrwAzbtxHwuLRZ0lygwbK/Wdj/HkF+kXFqZa
         t0zyow1SloWaXXOZXIE0977jt4Wiz+plaxgpT33Agc29Q4GETnR3ehOZcWXlJD7r8iEP
         IwG9qbQ2m5BoKliTxII4wt60lqgMNEC4TGdFbgK/4MF46AetU5TFoIV23ytFZPy1y6En
         eMtQmuclRhUSDjBqd/08MPDE9kGvASUfSZ4/7AVwgpa3M/CVW2CYfwo5p4rJKjVpebA3
         opvg==
X-Forwarded-Encrypted: i=1; AL+hErHqHwWrOyGz2liJdG+VbHD4IB8jKKXxsAIY26Un0PlbiZTSIwfdtv2IU83/sAtnh9n/G37qC9nfJZME+gWH@vger.kernel.org
X-Gm-Message-State: APuU4Z+DVMN78LgftuhGW+Uik42UWrOmLDV9rt78dagElqMn5e0SnLUU
	6j/olHOyfQ8tw/ktpOZqivlOh+xYllUTk7uuakhnfwmKKI4GW0FnCVzVtcQ4ISB2jznepdTQf68
	VHch+g+o7t+tm1nTwkuhnnSNruRPlydP6T64EZpjky1FLmJo1s0dlLPquH9tSm/r8/0ii
X-Gm-Gg: AYBFou1qI06WCpvvzpQPOnqTjXfDvbgsETnkH1a1IeHhM8ALuEGRqjQDZtooiieBwDn
	p7sW8hyrmXbJxtLIOWvvEBYHiLVzvWSoi5/6rl+E6O0jTJPk5jt1FH3JWxt/05Cun4v++zK9kue
	vw/kwALW2KpmrPtgeKHHryC+fVzOx98szjF7RBfkiw/WCr1NAXMwfg0QuI672kJFyx1BeWX73PO
	ppo9fllLQ3rD0TbdV1UdqnjJj2ua90LtqVGbotV1NOY6V6edtQMyj4Y7EY/j5xr2+SB5LEXxWbV
	khfHk6yplkeXnVzzmkgoL5MCl6Dd9jcS61RnCBHxgrljcWTPhrGBZPtaxd0OQAXw8CirlHt2xBD
	j8JF5PsiedZViF4YMP3fbCH5LHCudgh7deHZrQK8KBzX2HcMYO5mpWZc5SW8hb4XI
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384600685a.50.1795167960289;
        Fri, 20 Nov 2026 01:46:00 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384597185a.50.1795167959637;
        Fri, 20 Nov 2026 01:45:59 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm5035064f8f.1.2026.11.20.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:45:58 -0800 (PST)
Date: Fri, 20 Nov 2026 11:45:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
Message-ID: <lt5f7xkdms6d3vztcwsirtziova6o2y45hdovur7n52t4h4q6p@4nu7vv7aei4k>
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
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
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX7HPlFSPJZl71
 DF+PnYtZQodD+PHynjOttjewA/Ro9upHPUJsy53Ql82y6Ud24pKDaZvhUO78KyeGlF2jC2vIfKu
 tfI5/AMMjcbdWqhjKmRNoWC5tRvxHsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXxK8FPu5Kyl7n
 +UKp3lhlaqEp9lr5MPlEsDTfUsyFoKTajipAERNJpAeZnuJ1PllADG49kT5bZbPNTF/rzqzL10l
 6GTF1/2gDxxnHkl7iGAcQnrxizA24MzvgkXdaCK4apPFxtFI0p4HeVMamIzvjho4WN4svAEcnFw
 iFw27/LC8FNcnywE8Nm3uQJuDNvnZaxtXa3sYonnZiK1CqXWNBjl7rZ2i+u1OLrvEjlmf5IOrHq
 Sh86l8pEviTOaZlwM3sX36Wr5yM0qo2n+2kqGY3tVKwh/y2ixhTfsOVK9j0tUqCvyv+VEOhnABv
 j4NJ35wTr8TfvdNRJVofjW/RgRPNTGDC0HSItQ48rmSEs03ic+6J8+KeWUk0QyLhAdxJLDKrLHM
 z+f/tdMf++M5Tcw5FxF2ZQS2YS83k9Kxiia3JXlwm+AdKsY5OITrZinoX6mza2giuJyeW4Jb81M
 vYqnbJzwIen2U/1Ro1g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0016da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WYvkMGzYiQLzyujf63wA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bjTPJieYNn0-HD5VMKwL2LRelvqtycEM
X-Proofpoint-GUID: bjTPJieYNn0-HD5VMKwL2LRelvqtycEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 10:46:05, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

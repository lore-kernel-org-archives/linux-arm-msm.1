Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491300;
	b=lLgtqghjcio1VH1RjrXjRMvyF+JbnqTgezvqfyhfm2kkf8QLuglNuIwZ+YczeG/nq3lt
	 rxnCntPHUITuJfZ1GSXvQ/4hsGmEcK6uc2GTkAZNZITcsYIlPJB05ZZWPlbdtr9bV4TR8
	 oUveHN2zw2uT1H62uvlePSU0ja2nf7YxV9MPnI5JYwyqVd5107pfUR7tY7GIa3kXkwOU4
	 9X5Nm+xaKqiijBiNTDVs/J7v4sG5tRChI3TQ5yg90QveqxGuswgpXYVTwCsU//axurLAZ
	 PHXMEjbMSeA2d+17ECqXW4HZzNb/sV1+p3ppno6xGrYT8wFFGWRmuiTce0QR3AlwCDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
	b=rJ7SWTf2RiEFzg07132gs4lfCbPlj9ah28TQBDxsukUzt2j21ic6cZj/sDANoPuRLQbS
	 WyoDOWsxeJ8GC+5b1cEuEiCbCLIIFV6xMs6J01cstP9G8kJjAjQU1ZqY67AI3uBf7Uujk
	 s/uikSeuHFHOCFa6ZVnguqdfM9PLXtMUTXBj9jRjoEgHtFLTvSIZ3yvSZ2jQS1+sBcuaL
	 BZnud2Vxse0blawFkrEqdD1S6zVhxp1cI6UT/q/m6cFIKDzkdRsV0OpDj9eBLwrP9hMAy
	 2pNu0EAwDk7FgX7vXhcX+6THkmzwhy0Dq20JlbSJZ7hqNmtC7tJuCZQDJWVn4ZlibSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE9606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8aR664178072
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=; b=cspKiUEIS7Jz+WsG
	CL+hXvcNojI0UMBfCjMQzCzUOpF615gZAyQtaFg3vCuSoJLgvyr0RTx4s2U8Ai+I
	snCerdWYAQVqIIWay+IZcgq6dDMTl4TNOIL9LxJEklqTSXp0RXJxIHmN+PktyP7V
	ULw9cweFsISL2SjDcvYAuObRE3kADq42fGFLWrXKO1D59uHimup6yasFvpOsDaAG
	7WbjHWJ3HvxT+xfSvEZ+lnU6m8rMuCwy8ohXLTcanZI7NY6XxSFGY3S+m2abOJbx
	Uj+xBUOL88pJegolTad3D7sVwC5G8U87QzMouRBNCg3GHG1Ko8WykMeQU+VbpoD9
	bXp0sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n20rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso58708785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491299; x=1793096099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=HUcFsqG0qNlMmd89CavZCHBIRivguWI/hGES2joNfqm3YL5PekhTEOmDQivg6BYrGO
         Aj9MS+pltxDPq870KjEc/4toGdmXSICrM2zvirwTJX7pI6nOVjbHgQ6usOA+ES9vXN6q
         MuAl88600SvFJZ/8uOpUCEGuIKfycO6QCYXGLDDhPAo7egsddEJ2djWyMxoCtydb/7xy
         dZZG3xGkA8s+QpcpfCewJeYfUfRalXmp25EgHFwpWlgSPOP5+RMxYN/2LKms0d9OiEZs
         aa8SnSxgVWpP2CPHfXx2L7rsCNTZ9+XRPgbk0qL7ceB2kfjdkDy7nykGrXwzJ5mpRGW8
         W3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491299; x=1793096099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=TIkarl8bM0Q/1Z3N/aSfPjPL2rvWWo3pj5N6JoHT2cKL5TeUEDkax5ti57QH+00mYo
         f8CDrcWWFkDtDFqosLWW8eAzMMnuWVk2GU5QVn7xP5wvj0KrCYxV93b2bfkMQ8b3aXho
         94A0E8Dv0+4jh+BMgL5GYV5WZSoh4D1sjGuIXvaP6r1I31zXexdPXpDIJHFcm2cjsQUt
         gIe0gdF82nUKAMKCCufoB3e0GDJCs47BEiuP0XPEGzCJbVG9H5nkF9FIIBgiajf6+NeL
         OTMaZPRsQYsXH+AkejtdT9xXqU9VWUblPYjFV/c6HPkGzCeipSoMRt+H8qan9m/bHUOe
         eEAw==
X-Forwarded-Encrypted: i=1; AKwUvByrv7Ekjbg8Uc/+0lWXl7cfx3m9BzY/lUOREFgqsn5deGLmBH5ORBW5k6LFtTunYgCEvKD3pi/tjEFK0d1L@vger.kernel.org
X-Gm-Message-State: AFq9FYLOnqWKXC7tBC1Ac7Svc/A1ZZXIryS3g8fv/umYTQzZCc6dA5rs
	7C19jX3a3v/lCAMSYJ7Cni1wyF2qo1VJCSYPQHKSNmKmqtMVHuL2d/Bb7GKLWkkG7JCNGaa73rQ
	yx1WfihQly/CNrOTSSVB9WzJC8qzGTmzmyA06+M594YgP0/Pl/SgEDr9YL8akojCSCx6i
X-Gm-Gg: AYBFou3YXa846BkFlRPSlDTkrAO7PWMTrVCwtwp1VVECGqFu30iA/1Ea8iMEVXqsdQG
	RNzw+u+C2ICAwQNqvbtsk2ECk8epVX1fXZD3o3IeZboQWUxw/gdsOKNxlLToBdHFmYowH/Gttjk
	xuqf9Bnx79o0xPNN3TZ5H3WsNtMEqLAFNQGJlTLWIPB5xtkojJfA90yHOd5cYGQ3VAPpLgfk/wM
	HpUDJNqsobLifN3rC56LxfiCWOIgnl6l0ZRYM/3V40kezydzKcwYr8v0dw3STwl/qorHNIA6alB
	YnLXwexu5CAfp6tduwJgHe9xTlSMHbzPtcIZ3dzZHZLPW6NmOq0aF3LNQIxRYkK20UZ3vHXzE/V
	hkAnkLjqA7G/d6uWxIe6L1g==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729941285a.5.1792491298784;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729937585a.5.1792491298279;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c5e36sm5247373a12.17.2026.10.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:14:57 -0700 (PDT)
Message-ID: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:14:55 +0200
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2CrQEsAKSVvx6FleEUFGdKB1TxkUW1A0
X-Proofpoint-ORIG-GUID: 2CrQEsAKSVvx6FleEUFGdKB1TxkUW1A0
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad73f23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hFpWyfsUHjvwOGgMCfsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX+VaX4jElwFPi
 B7V/46jn93IthVuqI+oxqw+87tE7pYW9kABrdC84MU9xphNneY1IED3X3oUlEWUTNGJGzE13aZ/
 33jep3u1/i9JG6OeV86uylW0ktmTFtk4tHCCmzJE/p8bnPlEo69c6/FXWJ/XwvaEMARl6znTuxL
 leX/wbdK89NxTefokEfxiNZMCxWsyVgvqgPWgB4hkxSPVCHxdlXRCX5aNHcOhMaYlpQAxw+CN/a
 rBMtZH6LAiUpsESt3LVStkd2erhajrC8x/Ad7pW6/VT5nhPv2Ch2ffXwCg/wWLiBcwTazW1MAAe
 OCIluH+Mbahw9fzt5CQVav0Lp3lHbJmLyXD3bExfr6XHIPZC1g/VSBHzkQyR6gzEfMohfy9nOMj
 PPYF3nhQyRtjRZgHxR/Vy/3ka0B5KzCp9HGKAyv8T5IJzQGXffbOzkJwcRmOqXRDwp6jOL6D/ik
 L5neO0OlcJcSSSnzcqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX/9OamWulxdnv
 CGZGcUSBl19PA50tLsa5lf3KHjvAfC6rieNwBjcf8HduUaWODgYonHwEtS1n7Lx22wthhBsc5B3
 ZcAH2lBxRzKQX0qFKUSKn9MwtMi+yaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200040

On 10/9/26 5:04 AM, Le Qi wrote:
> The DP2 DAI link is missing from the sound card definition, preventing
> audio playback over the third DisplayPort interface.
> 
> Add the required codec, CPU, and platform DAI configuration to enable
> audio playback over DP2.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index a811d8ca2dbf..93cefffd1f46 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -641,6 +641,22 @@ platform {
>  				sound-dai = <&q6apm>;
>  			};
>  		};
> +
> +		dp2-dai-link {
> +			link-name = "DP2 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp2>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};

Srini, can/should this be in the SoC DT?

Konrad

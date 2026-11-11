Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401822;
	b=lElv0WaA41/K1fKtUUBqUZiK8UEZBFWIcH/tZnclLDmnjNbGT/nn5D414DexF20K5dLB
	 e13jcdybJyN34IMNIt720xa0bsXh5Fs5oXfT3UvEPlmNORmG2yZOgxkyj37UkGf7T6TUT
	 bS7v6aMiV8Ki1mHQZFuBsLkrzZ3shr/zYgFpI/cK5KMtf700GCKlXCEdd3L18BKBx2te8
	 mTScaTM3hRBFjAwC5l6Wn+MqmRhOFEwOeR6d7pqT3B4oyjNM18c2as4i36LXFOK7/cv49
	 XuFcDX0NGoYxdOq6gXwQFqdEYaShjViLb2s1CyMWFjHJGz5T0eFtY9Ut71w6HUS1bQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=;
	b=ckyX2KlcT26555ZZm7NlDhFCT9jJBSwaYwC7GzlPsqUihufNS5LFXdo7D5h+wr2DESmR
	 WAYdF6jYWfRbqk6nXwANAQd499+hzBsDAIfkfrGARQbTKuJ0dzwjFwZtjp8ywBDE6qyb9
	 Z/Quv7wM8lwC3inc6rqUBNaZxcsJBokJE/nGCfXkttG0JKrQSIkd6xQR+zTymjqWKvzwZ
	 yysR2qU5q826uo9AvHy3FJcMs2awb2m+aydIAV518KkbYFtPC3rPItCX1fx9lz3SuWJ9U
	 BK/Yg1CzmmAiDQgVMbSzUNEnh5Vx/pCUxyGrtxcE08YKaBZVW6sS85hDDDDETlSV/Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H5y91yvt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XCNogeQD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4A606A33F
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F4A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H5y91yvt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XCNogeQD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYrul2356368
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/UCd5VJwmYZ8AsAXEyxlvANK
	awnH+3JUytHywqOr4QE=; b=H5y91yvtVpwTu8MwGWjVhVjHs5AxaCuIpDQhyUbb
	5ltwCIVj/KYME8YvFz3xJ+dXrlld8Y+NipFbHhIpX7BwFo1LqMan1gprvo6I+Bfi
	i4HkxBW5s0dmSGX5NjVsR+LtanT2/BTGf5cAO4upiEVDhNm3J8M5iXPbAfKAy2Yt
	U+022EiwzRWxRpiyF1ZClRWgWAknZvCNjsaaQAyOgTwEMc6+BNIrvWW2tKbNld/P
	Hf/ZdShxn/zQrHHkgstfLP8WhRl473Dx5cYWD6RHnmCbVdG0suuuswx65lOYSW/3
	Cat1NM6YNu3TP9CV+Fy/Tw4yy9dmBkysLrqknobggS8VYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhw45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so518369785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401820; x=1795006620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=;
        b=XCNogeQDxrYkEehNqWvi1cEG7PkTFRolZGulZ3aDsVRg3GqIG/t+hM9TYO704K/9sE
         Hpe0iTofPI6v0ULVSBg/F99BEBD7haBb3SSsdbvhUUn8bh9TUndeCLPSWse+krGJVM5a
         mnCVk3ByyCTf687CMnE+I2Tl01z3ilsJsWvVs3l/Y4vRorDiJ9GUvxuNnRC1oaXsDN83
         waYs6ZjtbQTEU+THqiE5b3Q0wAadciE/etzV4OwIINCYUpdmxjYEbseHrh04zx9dWBNU
         edO/CTsFRcZs99u2r3i5mwkngc79ihcpoLA1YcXqgHUUunxeZ2Ft4FNvtNWUdeLEdkro
         tXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401820; x=1795006620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=;
        b=0txvgMzRNE6Br/A0U70CiyNY5qULQbVfXrRsHUubuH3yqWFi9dP8Za+8U1yO8GKgxU
         aftpeo5YJAax/p9xNKwZB3Y+IcYbw4n+dyMGxUw35R4KOXtatTcGzUC7oAa1cA/i06Cp
         LHaxQRbxV5RAOkWjjoEMluB2S6OnVzmOtCo4YBZuTBzSwOQPJEODN1gY8Bsw4v+5pN3C
         43Pdh/f8e+xqfDFzFUw6yON0SklQD2/OlpgWpSOw4dAi4M18KE29D/Zqj7qbZAbJec+d
         p5+fXZrpzhHkeO/ibcsILeK7g65PbcWxqCAxoan8JIHlDQEpoB0PqST10WyASxPt3EjD
         nqow==
X-Forwarded-Encrypted: i=1; AL+hErEW2oelp5Ia5oGHTCewrRB+8zXYURIp1DQNBXeJ9BhdN+on4cw3nNXGEuxaxBn51YY4RcwEFEplVeRf3WtG@vger.kernel.org
X-Gm-Message-State: APuU4Z86rhxRKDN/PW0ZifLGyNhntfIGQIfA1GdfvfKlzzXR/sAN7lXy
	IUTWzTgnWVyJJx4ePUKiyUlyjaXOII8lpSdkiRpCFXM6NoscI1+ykcZOLbq2/CeBLO1xEy60q+8
	pe9f1wTHi8cCDZ4/bMyR5tUvo8UWsxjtH/0eOv4IZDcjcoGYPvCH8Nzp2q8I7O1H7iFj/
X-Gm-Gg: AYBFou1luYKcIhCLc0eUQqt5HyKf3aV2xNWBjBqeFG3xtYbO51Idp4zG9muMclfzgHm
	M/QEtjR9aG5+NripXR1vJPnERSwTjnbKTWTibWDq2yefEd2S+SLSy/SpFMKJXgAZo7Chfm3Ont3
	OK1fhgRBnRl/M8xZU2q9ocIj+HiWKiYAhpKQQ/nBkfdKaQ326Ll2PuX4dZOvPFK2cHYOnHJvXfo
	K62BnGqp+XMrM64ZrQs21r3ca4dGJ4gWetww5aT3NWwK+9EUgOwZp4v8imMw1pOOITEPvkwkWDR
	28PFBDyg4/WrFzj8Qi6/SbbnioeaH5nANiyIz0dsuPOze6GpsKCAceVL+24tEGjzzOFy0KPjwQ0
	8uRLAO0Z70E8nboK5/ozDO8fHTV32GMgeWjgfWTuAkMg5ZxtAnrPOcIKVlntSDuXf1T+w39grRe
	Tw9E/TkhLAKD3pBTGcMbc3HKBO94WzDzR0Bg7VsFYxJbv9mMWs6CSMxcg5KWJK7w==
X-Received: by 2002:a05:620a:8003:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-947b00145edmr326012385a.44.1794401820095;
        Wed, 11 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:620a:8003:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-947b00145edmr326008685a.44.1794401819547;
        Wed, 11 Nov 2026 04:56:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm10581541fa.32.2026.11.11.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:58 -0800 (PST)
Date: Wed, 11 Nov 2026 14:56:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at
 resume
Message-ID: <zdlg56mjf43oaikozce7z5vneljg6nhk65vnqjiuxk2lbw47at@udkacgf63g6g>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
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
In-Reply-To: <20261111115303.3749380-14-ardb+git@google.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4661d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=583wMx11lFD8vOOkg28A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tmJokSoH4HLiTAWF0weAWCKHMeCycR3O
X-Proofpoint-GUID: tmJokSoH4HLiTAWF0weAWCKHMeCycR3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXyIyCpRgMzCO0
 ebe3O3qAPliKGY9LiRb+SuqHlPPk6hnwZ4h8xCkJhIcI2T+VGibpLEWdq8Surw+1i5iNOmuXRWH
 zyj07f2VYUEQIhoC/Gb1JNDaYr0mImWtwquZy811p1GSueHP1G1HNaYQjhB+CaT2LlOyOadL2+w
 cjf0jrh/d4B5ttN+0WKvkC7HrMrPWFqjrabFID3LYJSnPKa3Yb+pVQpxDEx5xmlRavgtJpEDi/W
 RVLK2KFOnWO3kxrsIEajWnt32i+0pTLcNQl2GQtauWhGFRWVss4Zo8AzX4ger4R9AwG/Leb2kEV
 N7oMuC+8GKT2NXdVGZufB59wpm0LkF1b9f9yh2xyBBPBerHbjKHqX2mXwT2Okcj0F6mMjubQDzU
 LtC8EOjatJuIZFI/DTIGlU6NN5AcQ5Mc4dO0WTMGa0ZQQJ8UKZAboZ332YcaMoe4P4jasLBG1X3
 YjMze3EBViBJ1etviLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXyq6iGUhuhFR8
 5X0YMpL9lEB9v/7wNhXuHa2M40dx0/IH0PSKqb4lv1O4jVe1ZJetPT14aC5y7QBhgdoYWejJm9+
 bbUvVHPKFmVvC1918Mtactm1BQMMEdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Wed, Nov 11, 2026 at 12:53:09PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
> to idle, the touchpad is often reset, presumably because it loses power,
> and it may still be starting up when it is powered on again at resume.
> If it doesn't acknowledge the power on command, i2c-hid tries once more
> 0.5 ms later, and then fails the resume:
> 
>   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
>   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> 
> hid-multitouch then never puts the touchpad back into touchpad mode, so
> it stays in the mouse mode it starts up in, without two-finger
> scrolling, until the next suspend and resume.
> 
> This happened after about one in eight suspends. With a debug patch that
> keeps trying, the touchpad answered the next attempt, about 6 ms later,
> each time it had missed the first two.
> 
> So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
> waits for at probe, and at every resume before powering the touchpad on,
> as the touchpad isn't a wakeup source.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

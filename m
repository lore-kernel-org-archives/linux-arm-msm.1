Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716782;
	b=JWWcvF9N7fo/YT05A4t7cMQo3GAedR0evtlS9O2Vg5bJp0aMWXePlr+trSvYKkOaTshu
	 naiBBicqfY7SWsG3xuEo1mU5kcg4rRFAoCQcxgTQcICfWH9Qs+v52yftizDLsc/FWI3yB
	 fSiRLVwZEbZkdRfH/FooTAF9f3Gu1oZG1LDDY08t1xdc7uIna2thfesLzeSjVP5NTwWxO
	 Dhw0r02l78en4I3/b6MvoH0kCMUp3RGPTfkfJnM6TMKxCywDqOtmnfFe/CSTQ2ZmCaNZ/
	 gaJbs8yXK64mkGlOm1xbZsRELribQCGM56q1c5jSmonh2EcMe26zt5x1ko+qbn7uWDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
	b=VW8MtQalVLL0Oyz2bzN59FcbRd9WyfO7yC899J+mJ+1nW+eVPrQzpX7dZm9iXvaY62iI
	 mdNaRZfZfXavVSsVu36NjmaoI29xFnnsWrk+tbsDR0Owe1JDXKyvUHD8fbrw0zFLz6bkP
	 gsf/aCeipg0HkMRyeMAOibleEtB8F008Lml5riumr0fGZVTsfDVauKRQVg/kIEQBbFWap
	 j+JFcgBgsm3AIjAqAqf8Vt6U5zjrnrMPNKtxirlTxwRZEPhtOJYHPHJ+rV1QmT8p21iIa
	 /K5Up8pp/wEBCgojb+sG9b1Ff5Kik7IbBYSGinxrVgX2jj7gUHd8i0i3AvF3Zbmq3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F1606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332F1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMF5qY2012734
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=; b=NX415fE3rWdzG1Sj
	Albm//L03kjdQGqn7HqFGco3s/S3+DeUF4rvHO9vy7Qg4lMeMR+5NejffyY81nBU
	lCLDwLMfgzRC8bhrIN62DwKsOwza8QFHnolHFmyJNGZiGu80As/YaftJTKWoV/AB
	cWqTwBtOo/9JOHdYqg5Eb1m8XwHvquOdgDZ4MMn/A4272z0CXd3NwBG1YiFiz1K8
	yFMo+/R1MWYegWgbtF3l5bLbOsw4ePMLySS63NaNzrGJX76LB3aJCqNJIKMMuMba
	Sz68QsKCA2yFBeIMKPREeOfMOQFlXbhHDNv627V1un/ZvJ5g/dzOn2nJVvSLvYTX
	8U64ew==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp97b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so1181865c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792716776; x=1793321576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=VsS9FNQ6IYusgSDTY/aBENcqBxTRdtpE33RYuVujnOzRPPthoEHB70Bnyl729fvBOF
         /JvYmwrFDTbOpu/ePYohOU23gS90avqMkOJyFWHYdFcmgIEDIR0Yeb5UJ+dEaAVOtMYq
         91N+oymuaHM6VrgtQmUoks4JHByIybEb3XL/F6XatE4Ma5hd8uGIN7cU0l2zOvVUdmQv
         uC6BjhaERamzDK9qWd7c3eajdWzs8BvvC+gxPV0y/5buuwHE6DmpwFctamQdxksn0UbL
         50028aQKxG8YfJSojm2ysnlD3563Uq/2wA4aS2oKjy+ZbLoElNwc33QoOUvPLDNxU67K
         itDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716776; x=1793321576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=lLk/rTujY5fvCx6174gzxlA/1ZrAIysLIBkPYPAwcMxJahkzK6IOhtotKe6O/Sm72E
         nDDEKt0tH72avsbZsiSqwlQiPVngEKYLmtjsFb/IdbLZjOJFSutOhBVSbLuzC4lAHUtW
         Czu1RB6QQYBFjIrAwZiRSvep+UJPutBV6IJgD8lxPoaSXh46TzlWB65DO/bvU9ePAdee
         qbn+hR0vcHtgY+osJLKnb8hZm89Iv5bD9JX6feuSeuWI+0L/KUth/ZrthjTIi4nYI+j6
         udXiumHuw18oGFZriyL+v+VBV13XvvcxkkYu0qijz2rOTLjkuWoKLDogIHuePMDgjLex
         N75w==
X-Forwarded-Encrypted: i=1; AKwUvBybAcY8lkteQ3bH3p0NT4yqz2K6XOwOV6swCk9SeA4pnRGOzyn67uhdCiTUhB6Mju4x09Gi5au8nhs9WENy@vger.kernel.org
X-Gm-Message-State: AFq9FYIxRwStQmmrAxhjUvGuP9hQkq8AtT988zJ1liPNCBddJj3e6YLX
	KSE/xg8iuma8d/gj3OUSPHhPTFy19QRf5swQVMQydVKtCTf9dYM7RVrT1opPejJ1zC54LVeVBzf
	avrsFoPKPsR1AvngXVJLVDT5KlQk8e+Xkb9X/UzessHX3VHpwOiq5f8wAEDmG7c0g/UHF
X-Gm-Gg: AYBFou1X262lTtnGAixHvcUSHuFrkIcm2zSiAhOrOFOtGcG+dAWB4gAaRjN9VxF4PbP
	S/YnjISMFNy8eg9J9E86Vxme0XkDDMZvsKBtnECn0L8s52x42eQocOkMw3wSqw0er8SpYm1AmTr
	c9Fgitp1zq0M+VCf9pbRo8pMIBBpunwXxEbI5fgzCnMRQfDZ9vs3Qzdd0Sc0xLhR6E96Jm8WKg2
	BBgbG92FdlhJPXOu4V7Zs8Sj02a7h/6xBXWSIBuEdhNmy+FwwaWJZRR8wUI7p5qATHjkllvWFz7
	KRoAXTmHdthPk6S29z8M1gr/G+nHP7OOnuLQgqGfD1e/mCK9OdqVIKma6wQONCr4JvkGTZZIMv+
	i6abO9fiCpiiI9Xvf8/fe7I3DOQvJbDTzqKvKkj0F0kr+DOZeKDVPH77LGw==
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050062c88.1.1792716775569;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050029c88.1.1792716775026;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1802501c88.14.2026.10.22.17.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:52:54 -0700 (PDT)
Message-ID: <101a2b35-5bcf-48c3-b862-6cd703c67d76@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:53 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <20261017104853.148839-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017104853.148839-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX7wP/gGdxqC9v
 BXkVIHeATyG6SctkFZfAeCXbMFidfNrUOuDK6H5akXHm+mXSaMAfXkxMPIV1Rkfdaqnw5Aaa4GT
 27j+o/vYujnYQeMDElPEeHbwMDaIIEs=
X-Proofpoint-GUID: 88PNQo7uMC_nFu6gq-I5JGMBQqQV8iy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX4PzuDFDk64sl
 QdfWGNRgzMUrtgMNFE8FyVtd4OhNeKOKTKTrof9W1Pk8lp2fVCPYkmX0BP3zCCEpwUVOQJGlFRC
 P0L3Ef+MFpqoNGZYNaAwuvvWBjNuTeFJ2b5bYV+8dDQQsrbmpcehdZwRzzgr85Lf8LC7sr3+nXH
 uMR+6Bz2uNVF+U5dzOGKb79fqblPwIYzhAer/XHJXGARPkYZpvEAlan2D+22aVQA+kvJqcDCxWN
 2aofxnXVJmmfBF6mOOb/J+u0jGEMm/SdrxFDr3Y5FWx2SfIwVGL0gP96rvjIBTL66co2cPFTlFa
 hVxYOmY+UbgTYNhqyQ2U9yYZigLqgny1yM0wmsZX4QfFyAUPTH3fsnow2Lfswh3L671VujafAPV
 KCwGqEE7i9/2IWOpPpFY64+XGdYqLv+agvLF6XIGSMXV7TaTjn6a6fvXbKwL8R/RQlBdoT4kD9z
 W4igWaqU9AK3A7SG+NA==
X-Proofpoint-ORIG-GUID: 88PNQo7uMC_nFu6gq-I5JGMBQqQV8iy_
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adaafe8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=orMkujGkvO2Z0ebMhLoA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230003

Hi George,

Thank you for bringing this up. This will be rectified in the next series.
Overlooked this.

Regards,
Anusha

On 10/17/2026 3:48 AM, George Neacsu wrote:
> Hi Anusha,
> 
> One units issue showed up while testing this on X1E80100.
> 
> camss_get_link_freq(..., cphy=true) returns the V4L2 C-PHY link
> frequency. The media documentation defines link frequency as the bus
> frequency, explicitly not the symbol rate; its C-PHY pixel-rate formula
> also has the factor of two that makes the C-PHY symbol rate twice the
> V4L2 link frequency.
> 
> For the SP11 IMX681, the exact Windows/QTI sensor mode programs PLL2
> for a 2.400 Gsym/s C-PHY rate (19.2 MHz * 375 / 3). The same 68-write
> mode programming was also observed live under KD on this machine.
> camss_get_link_freq() returns the corresponding 1.200 GHz V4L2 link
> frequency.
> 
> phy_mipi_cphy_get_default_config_for_hsclk() takes the high-speed symbol
> rate, so passing link_freq directly here fills hs_clk_rate with
> 1.2 Gsym/s rather than 2.4 Gsym/s. I think this wants:
> 
>     phy_mipi_cphy_get_default_config_for_hsclk((u64)link_freq * 2,
>                                                 num_lanes, cphy_cfg);
> 
> I instrumented that path on X1E and get link=1200000000 Hz and
> symbol=2400000000 sym/s. Capture succeeds with those values.
> 
> The qcom provider then needs to keep those units distinct too; I have a
> separate comment on that patch.
> 
> Thanks,
> George


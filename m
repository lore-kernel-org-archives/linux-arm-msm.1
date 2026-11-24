Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513182;
	b=sP1K+GdeTppSCjW8YSndWyc2+nKZENLZN2bovIKXGPIuuZ0cdUSdk6nEGs8yyqUT1VY0
	 NFXoEFquThzgUhwWCULdTr451LybPpba5Tk0iuFNPGyOfXNLJxvAbeRAdHbe+VlT0aRm4
	 Yg3OoumyYkUKs5XnA/2uoVhBO8F43IQKO+y1L/PWrK5liqSOWMGKN6aJawj4VMiMXH/BL
	 2B/UkY6jKn9M+2s9pYCA9xBss88I4V5TV31HbmZY5n1pyve5csUMqPbQ61ajgk9RnUvXp
	 sqqrgRtt7O6W1h/kWOzcAN8Dx5B+c16E2vMtTcwmLT5EVwpKJFw9OB2bmdFsH2KFFnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
	b=0JYavZb2ZA6yazpAkRt/TJFRQ4RJxFVNzYGZgt4fkPB0QWdRKxjQFI2nvXNcTG3R2LJs
	 rIV9+9jIgGBSbwMvvpQRfG1Xl08OXh6ia8oD2N8EyerUyqjtgaIp0jxskeRj8U/e0Udz2
	 EE0AJXDakdtDFJ/+EXTCG8VXweNoHWAVhHoCTb8mJ6VRfYQzofuFPE+f2qxuRiVBWM7dV
	 LI/rlLb+3mh5PIMTyBGD/61LiigoidvzqA3hmm+JKSo9ZjB62CuqUjA8Ev2XBhTXSs+24
	 xBwoaYEWA5C7gNPTcQjKYTg3WsvTW6Ihq2LglTg3vJGmiSzFZ7hOyyxBt66sdh1sFwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+GggpnO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B6606A6A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517B6606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+GggpnO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO87JlV901866
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=; b=dTk8bDSEiqxTbg3U
	oCSrJdEvIJRJSkFKq31xn8QSz8auMxz3OMom76294AEERLzHdUhss58H0lSpKtKE
	0GaaohZUnx/Bm02qtXna0C8ZvNdydTqmfOgYz5Ya4BooN2AIlE0bqVFrAUr2M09x
	WQBHSAzzCxlU2JArvfbOf0Ox0TJa8kCd/xsj9Uzb2ifO40ZhaJnSYI+tEP70a6zA
	MLkmsFiPQApe8HUCQuUGxINbSA2bXDDMhBVvw1h7NCf+9JCRZSx6LFOsX4edZAfz
	SZmzfte0A14PfJlIqWFkZdr5BYc47qJjsmfDDLW6UL8dbAJAucpUZzokS4tWxnBt
	SD+UPQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sthqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0f1c06332so65802787b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513180; cv=none;
        d=google.com; s=arc-20260327;
        b=oGYs4mRIvH4/uAaVGrFoUyFW7u8vTNcohUfugJutcgFLZWG5AWGvHgHVRRqNujiyfC
         b3ksZuX8qcpHIvmrSuqI5bVXgX0j10FepirFTFR6ChP+qyCabwdenmwcIVvVBoNRfCM9
         UKjri13nczwTXkUiDgt+ULkbVGyYfdh9/jMl23nzIEmDwiXyhmrXWg7jLpbrBONhasr9
         gFFLjmhXTggiPYo65g/aMclhFli4QwB+oabHGyHquIK7cigrodzVmGRdIGt+aP1hH09m
         iVBceOnVChaehT6pLir4pu1HJo0JarlYD2bDxS/NMuvnvE5j9GM+Y2Cxf3IC7WgxuDna
         I+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        fh=o96VEqCg4+52eln36pAx+ErxOlS8kAsuU0Elmakm6Aw=;
        b=aCblN4Y/u9mL1yhqIKqwvraE5J/uv3Awk8NGeZR4HXDB/z3KM+GQMU5yxrZCyxFQHc
         Y1fb9i+0p6zTgvr8T186dFCQvfK4byqhsP7J29DV/tyBfYQZ5EDBukJTYDM43XgSrPUo
         WU91+nJroU7MiKAOhKs7l//WB5mx/k6SvbUFfLyK+dM7JDxygczE9UnD1b6hJzeSn77z
         RjDE2GTws1h7NMGowUm6xyWKSEllNsXXWW51lVZXXHPWsQ/VqDTKBmZy60yTCVtu9XCt
         r9T6e187+zZ5+fN6ej3v/7cy5W2BJlvlxtshDbaYcVL3JmEXP9Ov5hLmHVOJYTF5wRQe
         d/DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513180; x=1796117980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=c+GggpnOrQYfUG0m9FuZ5n3FAct/57Kfq0QyeMTRCxO/JklwUEVRanh0WWu3kYdS82
         e9Y+WLGPjuRmxAm7yUpjBZ7y7H/rkfT+ejagKzIPb15A78OH7BegVBDEtNG/TuDb8Yk8
         5tPM7ZC0Kkp0UQntIOmbfUFPB2aev6mqILJsFV5mmj2mpD5q/2w8FcS9BjfqlaFxyoRb
         SdZOs0rrN6V0BbKflQ4nYecvfas5O5v50waU/3mCx0klXYKX6zKcb1WTj+Gk4MBvss9o
         qAxXLrbrHJHlGHL5kTfawDGYoImFi0S+sD+EOoSFf4pvkHvlm/0c6AfLBJJGQE65IcHs
         VaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513180; x=1796117980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=OToVapCIsYQM5DfV+DwNNGYOzV9iWpyj45k/1uqEsNsljcs8707+X5aG6W/9DKysVz
         SEzgfqnoMxbzWI/hNGl8lwFh0qVubrVqMUKRcUuAggNGpjKWHhpgNEqRIPmi4MjYDwha
         4teS+J8Fg9piQAh3krp3DVVtVG7McC9vhxuY8B8/0unsJyKkxioskyg6vcFJmXphTe78
         L+STJ+iMwc4ei+cp+LCISXLnOGGy+o5N9ZJglLWKK8UVT5E83QfvPDDsdJqYqA0xsJSt
         zrU+pIxw6s0vmzOlV6r4jHcLwc4eAjcplmCOrK6G5GSFx7mGqC7YCEx6W814nGtc3Txf
         AARg==
X-Forwarded-Encrypted: i=1; AL+hErHMzW3VOJtN+8lwMKJwArpMiP9wII5uRR5IO7lC1eAOgkxxcREsFwGz+Fo2SDrQFZEkOcOBy3fqQpTfXiVm@vger.kernel.org
X-Gm-Message-State: APuU4Z+C3RmFcqW7ryIACDNg8unEJSokREGfYwb06udUAMqhFvD9AV/R
	HK6xKBRs2gpHqMdg5q1o6tWg71UkvCPvvNxQHJApd6NBgu3sydxeUgactbHFXfKpcDo8ajZT4ms
	g/Pl+KT6QITfshCrsbc1G5GxupwInKbr9Ldk1e8cBDb4f33/cEj+KvMu9MtA3L8WHTBtBPfMbRE
	6dlc6QYnVe2UunY4z40LUHB1r47Qzubj2wXmXyJ4LjTmk=
X-Gm-Gg: AZFdTZcg1mPPgpJ+pVZKG61vW7C8KK1GpbSuHKgQld+KWro+ogYmiR9obIuqD26kj4J
	/WxOFkdC8yEaqQjNZj+LSDlyW4CwktsRtVKVuB1HxQNee88ViWnTBrY003kRu9rzZsAvIYnGpr/
	X7ZSXrDEa+cB5BX+BtL5Sdt/xlXtQMtiQ4Xh0hmmGWn2KOrbPuV6G11Gg=
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id 00721157ae682-8b5204e150amr61751907b3.44.1795513179570;
        Tue, 24 Nov 2026 01:39:39 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id
 00721157ae682-8b5204e150amr61751737b3.44.1795513179141; Tue, 24 Nov 2026
 01:39:39 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com> <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
In-Reply-To: <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:39:28 +0100
X-Gm-Features: Aa3M54r9dlpa1zHkZUYs8QQIpfUY7qTgP8CTQlWBurbJeaYxxsFl26_dQcCj_Yg
Message-ID: <CAPzfCAYSMpReEtrendxOHPtQRCEf-9UN--MywjS+f=7OOU4HXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB Debugger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yoFVaEBdWVyv9GfnptVnD_pB-T_ohllw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX/fuL4QAiSGbb
 TVNPtWR3OGbgzCMeNXs4JkfIJVEMlEIBXnqmW6UPDo/iBenWMZOtZMBelims2SjMTXukVxGAUHT
 mzCtWQNevyZIKHVhd0DV1YgeY1Pk/HE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX9DQBC35NSqhr
 X8nW5eMgQX7VScgRKYA2SeyDBpkFIsYpPtWoNodGBJHZHrNFD4xCfphkMOoYVjGYRo7mJx7TRyR
 ufFsOAbsRG0Na6e75GEo9ERdcZ8K9lUiA0cLdspoA5o8qhyY2SnVsO8+cg9ExlJAb8DaOl5Z4Pk
 Y2YI46Q41Y4JsN7/P99YlkKTcxmApYY5M0tibgsJadn0hNODEGC3Dw5j1HTO1+zdZZc+qF2+pg8
 MLPaTu2uC/sSpmKvaRkNxL3nAuecl6Mgdb/qhwfx38mJl0PuJv25wlW02scgicinkeip6HzDu1k
 nWQFHVVz/mEqH5lu1cTPeDO0bL61Z9br8jj+Lq14BJWcFrFjdsGl/F8jybGuuHj6nFxLtippueH
 /ETyBz82jCA4Z5P70ID+2fwvm3XJNitVEYloaYIcr6NSjH7zuSMu5RF5VUkbK85xHpQXYBh8/Z+
 MnQd9y0d9RWHdnVgONQ==
X-Proofpoint-ORIG-GUID: yoFVaEBdWVyv9GfnptVnD_pB-T_ohllw
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b055b5c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rs2CXmWTE79dq6mJqzAA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240036

Hi Krzysztof,

On Tue, Nov 24, 2026 at 7:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2026 17:42, Igor Opaniuk wrote:
> > Describe the EUD:
> >
> > - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> > - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
> >   syscon;
> > - its interrupt (eud_int[1], GIC SPI 189).
> >
> > Hook its port to a second endpoint of the dwc3 high-speed port so the
> > driver finds the role switch, while the board keeps the first endpoint
> > for its connector.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> USB parts in this patchset grew here, so now DTS must be split:

Will do in v3, thanks!

>
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
>
>
> Best regards,
> Krzysztof

Best regards,
Igor

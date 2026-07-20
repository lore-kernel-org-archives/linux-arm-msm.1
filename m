Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17930D3E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539139; cv=none; b=SiDZU3h+5OKGfCIvj9L3UARk8XQAmIOlAsj2AEywZpsLQgfZvxsRfNxi57byEfrcsiJHsQcbwJ9n04PT8pUB6RFN/FkhC1piHws1oeU5etXX8ouckQOmKGcvHe+oEELXWiRq8w0UPIzaewR6vzGp6bt/iVVnbDZnVpZG11mDEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539139; c=relaxed/simple;
	bh=sbod9CeyIRz7Ljpe4N6KGaocATinn+6GWhpqxloQqTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LveBjy5YOVQc8d66UpXv/suJ3Va7uC46+9+tu7xqdsdBxhwIYe9PUK0kOUdgPQHk2o8luB7TBKiUj8qyCkvNT2C6rx45D4sTLYTF2VcFedSGXVnfHkYNYWKm+8lEYOoWyGWso/OHoeIOBK9IByiVefXR0S55TP+4W1aYfLVoqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0lxtiT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/mkFI3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0lxtiT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/mkFI3+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RYU91420324
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=; b=n0lxtiT4IdPQFfgm
	HVhT0PV5N/p//xkhtliyliWPBJvFg/m/GFj6+Dr9VgGHF8DcdAan2RDrXXhhadca
	RaBeKKZMWA8nMxoIr49talXZmp9eNkhYt7U05tuBXV/YJ6cIUVS62XjoLmdvGNsn
	1oVXlhcYlg4Siugksm3iK14y+5eS5mXQcAYcC3mp0ixFaAo1KqZo2fFUEwpppCEL
	15RSLFh4rkvBUvlzmLRi7wy1tgWeMjGE6S8XqV0cJZpnwWtP1LEyCJRD5rDkD5kf
	DWbH3iDIO3sSwezkwEhGSZcdlKIjL+H18am802Hqnbw5b5F+KOb2RHmv3feGhYeI
	9eIsRg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7whhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:18:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so10451670b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539137; x=1785143937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=;
        b=O/mkFI3+gaubG6KYgAmz6feHlweANWMSH3RM0A1Q32uGNEAiyMOdai2xSfST+bgkpx
         HCexcSCysPt3oOnfWY2zX9Y+CSo87gMXRDIRwEqXM1peUZZ0GYyWKeLMwY9vhkJ+nvz+
         x3jEi+j+rPlijNGd2cfWMGhpiChqkqL5ULS3JA7ThRScXyOiA380NJEPCIianAKCkA8E
         PpnJGKStBVBCy+JESzOSa3iVDl9eb6O66YjokGiES+Lu1a9x4EOMRNxKiMO0cH21jc2i
         cb+/WJwYtiIx2dMSwuoZOLke1D+lF9YnYzv5v1+BXD+JWOklF7j3U0qbdu9aNQfRUCHs
         LL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539137; x=1785143937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=;
        b=snWJbvzU3sfl6wEXwNwN9Q+NgeetrIoBER5F8z7ValgPKc7xpVNYjNF7XamuuUvlnt
         fqD0Sq4wCTEcyLL1I/j7RgUlRpXXMY3fHCNo0Ps2A/xZ/rN4fziGw0Z3TcbDBEaQ4hzj
         FQEvUPSEs7FLK838EwgCbQMjT79HPWJ6L1hAYHxu/m6Yb11SYOx6OJjLu/aTYkQBpLwL
         mo23yDYj57WADRCKlbHc6RgHKd2zc4s+mTJ8XBZbIXNDwna/NLwmEEvf3I3nwr1VVZkk
         gO6IxzUFevLAPaURHFLpwzyMToBkD37AwMdhYpvEXRavl+rujUDxCrk0snVeW7QY+Plt
         EVWA==
X-Gm-Message-State: AOJu0YzdVOY4PX2XL/NxnNFLH/+671ZGTa9Gu9ITfue5TgTQSNgaKVhX
	cSszW/oXNBPC4Spe8ojsr125nWIkMQwJY/QXTfwp75ObF/BLCRsyB/JFt0Yuv0WtsPn3zC2WMw/
	LCAkS4zSyUEFRVhdtNN7cmI1+6fp+yUcI/Ienj7Bx/6IcrKkgjktyVTSUBsZbGtTzwr4M
X-Gm-Gg: AfdE7ckZ4eJVRRYM1tooaCcCYL16BZwPPfJ+emyArwa17ytlOsV3hb/hzST5QO3Wva/
	w3gmGVSEAYYJnIOiNcyVEVO56o9WeQ2ODPn2FlQ3EvoT8JuPhEAbh6hhjALU5SKP+pH2EOfEGxV
	NWQRmBWbnws+usaAgyOeO3Xk1heMh8EGOENfXWMwpm01l1WVL9N7p/p3/LhPMyhRz9wFC1zArti
	nMhlENmauM8w3CMkxOW0QI/mdQMrjSSS7+zKRRUr48WFPvqMr11Ljrvr2JnMR+5zli9L/RX7HgF
	1Rfz15hMYrA1HGPfsoJ7tPyf/7yJa2C9HjFXu7mFLR2KRnbR0w0/fJNuzlNgpcgViB2hms5AZjF
	coBN4gp17peVGdXimmUl9OzIhtui1T/CsU6I2NQalT3XR
X-Received: by 2002:a05:6a00:32cd:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84c29505e33mr12646791b3a.40.1784539136733;
        Mon, 20 Jul 2026 02:18:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:32cd:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84c29505e33mr12646768b3a.40.1784539136272;
        Mon, 20 Jul 2026 02:18:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f94c31sm4349636a12.13.2026.07.20.02.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:18:55 -0700 (PDT)
Message-ID: <dc3cd714-dc03-4586-88dc-333a5ed6846e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:48:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group
 pins
To: Taceddin Sancak <ts.solidarity@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfX+kAgFJ9iOS0U
 bVvm/bCVCZ7xCA2V3ABAePrTxS3j+FjE0Ndbkb/ZAsrELURTi7VXVnuBcQ9gZ89B7ffNNRrVdDZ
 JS3kuNNyK2T3vP1yy3nISAJPQ8Xo+g7acvsRctebnNNTM2Jk0IFQ+mKDbsXgKvuUhws14rZjWf6
 tkNPGe2c41ail0vgU4q96DDzX7ZFEGvNbsud1NwkAxT7kwcZs1tnrtlnHes3BeguoPgGwVstxvR
 sAmzk7nqUvNE5wnFSnQZMkujw7E9OFVsAEcYDG6c1SfyfmJdca7nHv4F6wxQXCTgRXGJ8cJmVuY
 TAuGPBvAlyjdTAZrtOrOHS+Oqg41ZI0URUrVzEr2wlBQhpKuuMUyn4/MgEdSfuM2BfQ2/1eryYE
 HxKreABkoYWUqqOkxyKDcsT4uAH/n5NXGFO0PclXxOqutxcu1a4Kg53vN9DzHma8PXb59L4LtU+
 Btk2nlvqYIEX69RyLkA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de801 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=abRMFraXAkW8j9leBJwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4O4cVyFrjNN9KbMDGem6nge94pvd-Hlz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfX4cIwQYu5/F9+
 b0ferREIO/FOUMC/Ic8xHEDZGFAcyVY/xq1UXY7MjEI5K/eBAOYgtglgH5F5VUn5vyBI1eSIVR/
 dUXQ86/mzp86ouSmeqGGOSVCs3vQIwQ=
X-Proofpoint-GUID: 4O4cVyFrjNN9KbMDGem6nge94pvd-Hlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200103


On 7/18/2026 5:51 AM, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
>
> Point both groups at gpio39, matching the pingroup table. This also
> mirrors the primary audio MCLK pair, where the mclk0 and mclk1
> variants live on separate pins (gpio53 and gpio51 respectively).
>
> Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
> ---

Thanks for catching this!

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


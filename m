Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787133;
	b=KJ+5uGNEp7X/vB9/WZhp6suaYsYxVQ+iHm9n9DJY6a4QF+kw0F3qH/OLTCX2iBUk1fcx
	 jCeySR0EXY0TY1urNpxgNOfzjFjbrxUdNFJJDfFp+Ft7kyGY3tiHtVZk+3zvcmh5dqPdS
	 mKSb9nel0E4jvTx5H+HK+SZFjkV9WHBY+KasmWd1LTXmTWL7B3goTV3SuiD9iErIz7yZM
	 GBjH9iFTj9m14PItwSo4XhGS1vwcBiaCIPAKQHAUBGnArdW/1SUbYirRG5Ore8FpFGF5y
	 M46MiDeve4af4J1QxCxGyOQAxq8b+9kBKzpNimhCVRTeI13+cRIpTOv9QFmJgDb6vCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
	b=IGOLVCWVsnuCazcpKw2z9xwagcnzC6A2F1+9QlgJ/8MGAWRAAodawjASp0hyBE76MnNQ
	 qY7S9Wx9W9EP5Yjqk+Zk7qYGQHD+0usjLqYabph8niHVk0t7EFB/swfhSUPm7Wispch/d
	 7L6Z9OTLT2TbDFzNDkYdLZBc5k6BukuDwcvZLjoiA9KHE7fRBDWX5mY3DhKuyJfLptZHj
	 rswooyeNELsHpdccsDdjamIEKVTbLLuidbCga8l/R4X8YDOzohIwxQ4cj+e2tpCGGHF3A
	 /u0J9ktbdoF91KXKDAotzs02f8iQHTmGW/d5EXg56dMZ97bs07SyXKnIuAGFJ9yFOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LZsWLSvD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbsu7DeE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3A606A33F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB3A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LZsWLSvD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbsu7DeE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChH4Q515744
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=; b=LZsWLSvDbEYy1cLu
	pcHv1Opi4Uksg74eBpY0ZkrCJxpmeYSg9GxFGlx+QaPqv8ZaV1Y9ZNFxbi5hftTL
	FHWyMUHog+wUYMYQtor1AHGQIg6W2P9wn26PcReDtjWO8a89YFIUdXOu3cggBWcr
	+hDHC1TbJzp2mwsEIuqdwFurrcHyNklXuKLBKk9rGuNTuez0EbQHuPmcRR6pGOmZ
	qyXrZODCVe2XP49NQs/+jJb9vLkUP4h+utbnR/WJHr2fX7UtOCwINm+Kq/1xa8Qj
	rsejN2ZnCVbrMXQ+kPUFOvccs0fuCk6P6Ii9+4Xdsw6++21Qpc81zwzk0V6Oahh5
	ojti8Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49b8bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfa1bf94cso168064e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787131; x=1796391931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
        b=Tbsu7DeEIZfrvujv7jEvTUeD2gUIUsVleMf665e8iJuRaMY+qj1dTe9qkvytLpv/Bw
         YgTueEDb6hdf/CA8uXkuHVaCa8VFE1WyT8jA/lXuMYQjG6sRbnnUmSI68uLysn9tvJ81
         4a/S4CgiFCr1JamSSQmIhW08qzaMv6gsxX1i48vjDIVVyTPSNNXw0LhF2NnoVaJQluyA
         n3w3djtIv9qix3HIxtu/MkzMTfBCjeTYJn9AHJMhg0hothTfZDZRoTpAKl4pue7QyIgB
         AXL68K/ZYEhKhdnmdMTh2zZXnMMeTV5w/1lPlruI5xRzGqpbgVd2pO0d6mG0y/5bLaq+
         Yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787131; x=1796391931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
        b=JpaW9G/lg7eW6ZpAYyREPLIjlWR4qB+zT24oZP4b+wCvlFkdjP5f3/aGVndzowPqin
         7iCE49uqwl8MemgSjc3/XEz39bnxodqUceYYnE/VmV01+6FEl+u369jEJkmuByxR3Z+S
         ZHZOh23mVVJvO04v5X5e2eTsiLt8mkesctK3lOx6Ux3TplzGKfjEb/uun0EBcTJ1Y38y
         zvHPpqGxwYy7FenTSkkEPC0MgB8ot5VNRCYtxvgRpJblAAV77OEcrnfzr6lRKiTC0cXo
         N4O4ulNotNevXq+TQIpznRFCmzVtZaI4tjPqdWcKhgn7NeGCV2oVQ5D8tDQ1FQLcCchr
         INwg==
X-Gm-Message-State: APuU4Z/5n6C4d/XgXX7RFGJB5j/vKGqkTxBvlOjMPCJeIdpoySYr0Ewr
	azstqR+mBCZcz5BVfv0zSwQoG1KHe/6TLRLwh/+hFjbqGTUiXvvJt9EimsmME4NI0986hTJpdqc
	1yEUytXI64MQCHnLzbOCZQeSrQq+cnzzD7RaGmK1RxO1BxviKJF9DZjsWWDywC317S47D
X-Gm-Gg: AZFdTZdF+M197bFYEIJ1A2vTqxifqT6b4lJE4r8V4h5Nu/PY6KIv9j8H8OXj7YasXpE
	22M09hjP7EHxSL7mtDLmO6CeN+JqfXnlMPGqHVirkDFxAHN3nWFrlcTL0MYwjZCKIRxTqYP4JvP
	puxUubsMoRGIMKrrxta8M4X6uis+Wlo+/E9S69kUDV0LvlsrmQhAsh/gvmlrOP0hJP8msuma6y5
	Reh2KaC8wSbFDgOIOpy/JaBB+bTuWeUSWuQTatGdYgpzxwHE11oGjH1E/VPnGtFD8y4DU240i3N
	ZhbsnFyHS7nb5koFzQaIkQClQpzuQGCE9lgvHl93LUd/fO4Kj1IhQd/gN7Zdy4LypnAkBP4rf0N
	LtHXgsiHmjZwF+GdQEbOuzahNCP/a5QBwyiJVts1vBgvzXsKqIJeiEHcUrQFmc+Suz6gBQLE=
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr18107568e0c.3.1795787130998;
        Fri, 27 Nov 2026 05:45:30 -0800 (PST)
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr18107503e0c.3.1795787130540;
        Fri, 27 Nov 2026 05:45:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm864314266b.80.2026.11.27.05.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:45:29 -0800 (PST)
Message-ID: <26b3fb31-7f1d-4464-8c6b-6a70a962d1e6@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:45:28 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: Enable
 SMB2370_2
To: darkobas@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261124-yoga-slim7x-smb2370-v1-1-2656ec0226e7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-yoga-slim7x-smb2370-v1-1-2656ec0226e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LSAESjdlsTUvqt7FZu1tbo4jTNcvYmHo
X-Proofpoint-ORIG-GUID: LSAESjdlsTUvqt7FZu1tbo4jTNcvYmHo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfXxoyNAtCpHPWi
 iAU0C+AAn+7+XkyICuFHV22TpLhrnWnZtBIT0L1NEgJeHCxoSL5B72Xogr25dTyQfiCH/eLHUNM
 XKCSDmZx619MBUmnCZg1bk2LT61Uelk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX3GOQ5tum5+eA
 yA750/b4xHU2uqlJKu1Ls/odUqy6U96QZXIQOZFIErE7W7lmwSXaVj0h9Q5wFHdcgsa9wmg9T8l
 F0v5le6Utzpa5wQwYnvCRsk1vyxzXCIPJaoB1iPeROgxFOuBpZBqI6cRnzeDqyDez042YhzOMyE
 L0OvG5rn0Kd7+Tl5UxfHSIxVw7zgUlWjMt73w3lqbKmOXHFk2K5Yvj6wJswy8wQ0WXpG4t6Tbib
 36TGXxv4NsZu5lRjSM0vzqj/a7WGS5+vP6hLY4MzC/Xdmv8z5HvGdthQNqQz4bTXJCI8AMIHwmT
 2Sd4hzAmcTSlNqYZg2ILZkiCT1OL0qBTbw33zdd7JXH+PrUffLKTUL73TmI/DcZbA8BXkchDM2+
 RmpwVfm2EIwjaHyCbiemFV8HztYYrPThSPAjQVMZaj9n98yLNvuijnfbMtF2L2XG6YPA9iOnR9b
 kTB+QzoVXJA9PQJSPeg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09897c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iV1U767r0ELgtbyuQYUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054

On 11/24/26 10:51 PM, Marko Zidaric via B4 Relay wrote:
> From: Marko Zidaric <darkobas@gmail.com>
> 
> The eUSB2 repeater of the third Type-C port sits on SMB2370_2, which is
> disabled by default. The board file only set status on the repeater
> child node, so usb_2 never probes.
> 
> Enable the PMIC node instead.
> 
> Fixes: a741ecde8949 ("arm64: dts: qcom: glymur: Add Lenovo Yoga Slim 7x Gen11")
> Signed-off-by: Marko Zidaric <darkobas@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

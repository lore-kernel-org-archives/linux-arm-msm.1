Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445339;
	b=duSuduaQuz2Icu+r8x0UmnLOWINaSOXkFg2HBmR5oZ4Smb+XkBaYhZeaWv4YrirgddCF
	 X01po19Qb/Qs8z5BmkfxQnUzTCymYG2xcGfKLhGLBcgHzc/lMOT9Rwhl1jOXZIp5tqLR8
	 dT2ywwNzwxlTNA1hfrnqc3Yg7FlFaLzp+J2Aug3u72dVsblJnbOSrUOWAOvLkmizU4krT
	 EYDLEj4FPzq86+fjChPodQjfr/gHrtFttFJrMmDz102ZIqoOa8GEnpptp4IMHZf0WIfMP
	 LN1KjUStmfDf913EKTtuQlLKIj/PwUWE6BgWWrQiuDcNjEiJMyKVzrIaADf5RWfxJyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
	b=GjmceGmF5q6JpN5SuSEojM+4HQXaZIb1wzoAATDWbyAVl7ZA4IIrVopgGfHOeKBmkymq
	 O0w39Cw0iP8QZZmG1piwLurvOefOx26EfMxZCKLels2PsNJLgk/SiLb6XGQPtuM57/Pia
	 sh6HVnc2JMmT5C2NX5wXMPRSHYYWZruZxbZ8w4W4KeVTVpr/R5pdl+lgxhfuRXkUdKg1F
	 i/W++EANPAokiCVuSNVsX7/8dgsX5UVY2gUnU/MnTb8x9zORHo/KtbM/ctLd1prz9RApy
	 cI/xOkBlF0pttMdFQ717yYYkZOMRtr85sceqKRR6mfTVbpYp/hfZw4NI21e8je8JwzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21477606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21477606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGNQ1461376
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=; b=F0Sm1c7JRzX7fvK6
	XeOFGXUg45CR5LVVDcMKJ3oVzjSiZ8KWoL+W8MXqEDIxwngQpLsy9o9b30AVAhlQ
	c2nydHb/SMMdVZcgWOOXuQIGnDy8/Syrh4xE20VK/5upvKTve5fThoBL0eKuR1y9
	Tako8aUQFEjLZDtMS811xarS/V0YhoU8VS5z+nscFakKcNvKSOM0UGgNKVDGte4J
	6E3fOMbsFbhPi+P7hrdfDMo6szL2hDdJ7TiOyyyoQIvuFkplifazX450u5xeAj0r
	ggR71aUnECanCvVqALZFw3veWSHl9NN8AUAtft5mdwPVbgF3e6XElzBaW6Yu+o0a
	Yc72Sw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1u6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2130619241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445337; x=1796050137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=CjS8a3QQJ/MDDbIe5tqqwX+7fb2l5BfWXZH5b1sOkfQxizgHb2SsJ8bDHCbuvmK+/G
         HCJ7Y/5t7vMAR2cuM8zGN90+hIhl8hvvW1nl4xRXHeUznFQzTTYlLZJPrMus9xUdM4cG
         o7IB1IzXFPGuDxKhydqakUwmrBBdw/aV/KZ0/Lvo3rtOrmx701DsBRHKhBmA90cyu5lk
         gtEGoBkBLiPhNQLOLlL4UlIt/cXBpxYXcCOQOOchsKQIArZWOTFBbQtxcH18uMvMc/Eg
         KcAadn+qQwvDGsLIqLJs5eCWZc5KKDF1Ihy1yDzZw6FYeFulCnpO/J2NffwbEdVr7PSn
         YZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445337; x=1796050137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=D7Al/LVPDemgg6SWNRk7J3EMF8k9/VaPQvR30wC4Sisl2V5MYsSvXJapAWBc6b18AJ
         KWn5nM5iXFieQFJXgNQPRjH9oAasMcMrHITk7NI60+YoFgWteI0erwHmOU0rt5DN9VYA
         sn7MONeD7W7hqB7PioWkb7ALyHAqqbzZZu4lTX1Ohgq5sF5eZY2wKC/YAWTXZ8u5R+QF
         X22eQZ/WDiUps2o+9FckwbPCCmNEc1hSwZ8mA1giU7NpcAiVr4xVI68K7YJbxcAhk+C5
         jZ2Iz7x16G9ZNqDoFCVG3R2cqgDCpncbDOKEofrd+DcCY7n+0SJhK0tAt74p6wpTUnxA
         /6Yw==
X-Forwarded-Encrypted: i=1; AL+hErFuJRt7FjQHqiH52STmjBlmKOx+Iz7wezxNPNvDvCAdzaEsXDUaVVOdcvthzBdNfanWFiE3SGxM7yVtC9c5@vger.kernel.org
X-Gm-Message-State: APuU4Z/5f9iEkVt0o+JpfC3IVj0QFSTyQnkPUZwlPEfr/cTHzkzxDJJy
	XqQpLYvFWNXfIhZ3L2DScKNl11blF9qipTCMw97syXFmlttENFTBJxJz29NpmY0yP8xsX7Ym1r8
	WkKz5GlTOfn6PFBQGExKknOlgIHrXsZeb4VlX3kBoIBAdyfsZYxK1147HU33nHw+itcXs
X-Gm-Gg: AZFdTZd5q4Eh8wkJIf4riLmq4EQWUNTUHKS8K7sXTOIw/KDVUdDvw7Jslro/RDeaPPa
	G5ezIarLSc41FecQGCI6QvGD+bm0D9dtYgXyl/tGw6DOck55zw59bT5uicxssxCIgEGgm3p+Pqm
	DrxETbZk7bRx4EthYUg5cXa0N+GFNON4MXNnDhdxtuQ3cD/SVmF3mu/HVFt4n3Jh2Jx4dsT9+3N
	6CiDrx0WuM4istSHQMeQp/NgdRdpE3jAK1HZ+UUMs40+fBbzTQGH+FEFvQXP4qOCR+c5USZjOry
	46DDpxFp88wCfo3Qm+m7NqxNnp0eDyy9LfgDmC+EImpfvvht+f9a0qLe9beh1i6fRKzOV5x/y/4
	Sol9wesrrCEZSuPDgduMsQrUkJmCAwpcuuOdwcyrChTudbdmyPlOueTucWtdjahYOfGpJZN5Mn0
	3YIyqYI2s+TaUt+urHf8UupP3K4hoQrTMzXqQ9QYAEzZ8PJB06vuGPpVHWwa5hNw==
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086681e0c.5.1795445337300;
        Mon, 23 Nov 2026 06:48:57 -0800 (PST)
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086642e0c.5.1795445336819;
        Mon, 23 Nov 2026 06:48:56 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm176824865e9.1.2026.11.23.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:48:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
Date: Mon, 23 Nov 2026 15:48:52 +0100
Message-ID: <179544532972.78418.5551704797974851196.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX5uFmYD+vAInu
 G0Wvqz/IV1YOXMWGGAqTQ4ASadGGJdpQxqd7ZwmzVgM/AxRTbCmcodRNaEqpGMlbyuq+cC2oMnI
 +Vd4cn/twL/KgxXBu6gnZSyIQO+ma7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXxacN86fTt5qo
 kb8rYSwCrj9IhM6yiMlHC2TK2+ql9rThPBFAdkT18RNh704WrJFAalyyJrnAN+oMuXGtgPkMcmz
 WPA+/zVfULN/bWdyMhcxY2wLI2SGd5aW9cOCI7bk2DL7J4EdV/XEyKmtq5H35OC7iJMG+J7gJiK
 U04IOzfrkLWUA59R0Mjma+yc9el0XU9j4cSZ9tqdrLpQZONxppWO6Be2joflQTDe56afkJiEoK1
 /ohPPn1H82KKJly3KmVzpfz0CkWGs/66PXEnyk8oH2uFcTGRsosd/Ho21mWOmLgyXhbmlWXWaBJ
 BgHqeUFcDzf75TixZwkI9JsTT6shN/7FReN+SRiJs9A5cgJbXpwPpJEdS4aU0r/GkI/eO//9wYn
 0Oxf3LA2+5zvHq3YjiZi+xQwRl222NU8z4GZpO1XjwJyQ+iF/S4AYV3Pwul/sYaCneS4j7U3KoS
 y4y0NuUD2cXDMawFBBA==
X-Proofpoint-ORIG-GUID: C1I9wnb5WXyGMMARTWz9BOcymTXoX5GD
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04525a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YyyA3Ubz8UxOzji9argA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: C1I9wnb5WXyGMMARTWz9BOcymTXoX5GD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058


On Wed, 18 Nov 2026 19:07:29 +0530, Gopi Chandra Sekhar Reddy Kanala wrote:
> The LPASS LPI pin controllers only have runtime PM callbacks, so their
> clock votes stay held across system suspend when a consumer, such as a
> SoundWire controller, is active when suspend starts. On Glymur CRD this
> keeps CX and DDR from collapsing in s2idle.
> 
> Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
> driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
> and pm_runtime_force_resume() as the system sleep callbacks there, so
> the fix covers all the SoC-specific drivers.
> 
> [...]

Applied, thanks!

[1/2] pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      https://git.kernel.org/brgl/c/d4a6257af491f8a087d34bd5d3f4cd384d4fe266
[2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
      https://git.kernel.org/brgl/c/55d571be69fa9b1ecf8b417fdf768c4eb8b28d23

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

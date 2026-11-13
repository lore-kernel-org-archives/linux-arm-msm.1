Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562736;
	b=2pNr1mK5OOF/+C6BeOa5y7TxSTLr8NxAHbTytRjuBFglJfSjJqpbLag6mrnbK/gkcKMn
	 Aglq3bsziCdMjTAaJuJ0cYpPiDdRu55vAausNbLHcf4uaFupJxS+8gevOTMPuT41zPuuq
	 hf2bvBmTHYqAJZaJHRBiNoVhOcWah27fczkANdN4wvHU1jJjqPeziHcmDA6D8Lf0dTzvQ
	 dkQ+ZvKv0OvQ+Ni+cMsjuBkaW3WvC7kAdxA8qnb/XI+ijD7wP4dlCE2tF5gn7quEs8ZzE
	 U0N2RMXYPSxZo8wRV2FhhwFEp0lbioJijKLgnMo0AD3uV6Cmfi22tzLvZ6yIkUxiuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
	b=1BE5qar56pIXUwQE5vpwcb5oHuUZwWbB15mz7TSsFJjrW8xVhTzjG0CUbRHi/wg8Xrpi
	 ms9Oic4oYynMLlq9dfI0QcAE7Vhh5q3yvS1B+KxW9B4po2pfcJ9oASpGp71mL/sZnXq4D
	 bDncllpDKQEFxpSdXl3PdflTh9pgLkLt+vYLOi4z4srk/viQAOBycF97stxCW/Iy1NlCY
	 hVuIhpKqzPwkAU0ersDbUdHicDka8eqfY2ATGk+qWU5XAHYNQEkmj1h7M59WYH1UVRd1C
	 6HDxeQnjYXD/IBcrfeHTZGTEINU/Qgv7T1uHDYi2R125C6wkHtgEBjonlZJGtxQW2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3NAKU1m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tb9sg/xS";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B77606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B77606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3NAKU1m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb9sg/xS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDIA3620409
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0xdc5hE8DpjyjG+3BwiQWw
	ntxFFfPKdzXzf7D3MWa5o=; b=S3NAKU1mWFHhIVE5xrQRp70Qg5h8j1oLzQePcy
	DyiUWYqA10HzoVw/c+WI95Su6LNOjRPnxOiWdiDGzisq2nCxKFEwsuOjF3eW7d1T
	kCeYuzqNA2WtxCBxuaqRdGnHzu6fU+J6iYERgtkhCxU1aoV5Ht15U91k/HZZosXt
	Tc3GHy4VnybGI2Pg9R+klahTW4NHFl9e7RlkdDgL5RskRkKM/vI/vjPvkNwUsYrW
	QF84fVlm7KvwkfmJTMcelTY9QUY6pd2y4cf/Q1FPwwYYt2Zpl2UtFK9hYn+05zCq
	PyoG75cIk+z8QCujtKSvNwf1zkSZe4+wwWCNYmgNszjRUsBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8sv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so161484485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562734; x=1795167534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
        b=Tb9sg/xSB4iG7uQGZ32tH6ZLpfgUG7knxQf8JEH5Z6jOwMZJv5XI9YY9lnns+cLOt+
         tl94uql9fE68mu+7Pgl0TWIWftghwL/lIKAyI8uKGKBfFRockQXAtDUKcIpDMkzi3qO+
         pKdHvA42mltM34pVF5KyvZQGNrxJqubCUCAURoK0NDcFnjuaUQ4N7Vy3L9OIhoRomPmr
         b88kTU3y+RbyQJ8v1qfLUiUqKCl+KY2TF4gLn9MDtwYVRDQUP7owQAO8hYEzjvO0+tqG
         Mr8bizFb11M3H1Wc1aJonuu9l38Zstecv2RkSiviebM2WhsdWNDHime1XuzJZc/ayNKZ
         a7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562734; x=1795167534;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
        b=yPlyylo8pmi5/eJnmikrO5B6c6sfdxck/rcHhypHIaftIN0Gtu0vvXX1oArSdCeSOO
         6Cfhg5k/V8/bl1xs2OagahuATPmhPeGpt2lpkibpb3EIkWnidYvGbxRTig1GCiMSGofl
         STqHuyLx+HYOIdRJjwMp9AptoDaFua1dQz+JeJfLJtY9/PIbf9YFKe3muOFrykV6LOXP
         82MU7IA36KZG1v/g52FmKhPkJDMiD0ViBwFs44mSn9IL4eoSmoRZ0rWVWoGSgFAVGCMh
         vqgBFhqwqr+p7C43yzA6stGQSGi573U7cSPWDN1idpL06oLjM10sm02DmcXr+b/Bktnl
         zdfQ==
X-Gm-Message-State: APuU4Z8Bbq4tiXGcMEkp9Na7vkDbfbOpCeM6aKAQp9rzu3xxK97ic4Do
	FwBJ5GFwW7PRk3NcnyrTNHd50Q1qtGNN0GRHg7TTfjbXaOfXqloQXMFqsUjiQBhRoY2KFBo+i6G
	lKjhqRj8Xt67egL/FcoSoCRTkzJfTKKAMmO+K3NYu8Gtp4wrEMdPYubs36GKh+6xHTM7E
X-Gm-Gg: AYBFou3uX7HNZtbZSyQxlOsYWbQ87Bl/liT0Bhx/kir1JqWqD13sLXjFx534FtmdWmP
	htL1NVXGztVBbtazjHI24L8GU5usqVNjLwrOfrUDlY1x+qmvAqdDZbIomL9EacgwY8+crAwydG9
	LFGk1z2Pm5Nav8T2DJT3rtWwvlPSgzxv4xFRL/8DvUnRYvbf5GqHb9R178q0pYK1JDyWM+rVOtS
	HZ6LMPUByYRwIKkl4raLz3pIsfnFAecOYPk19pOfI+DU2aNmyucV7Y0VznOk5bRATP7uhk9p3cz
	pjN/x3EI6rMgxgBNi+dCc7wCXN4BKecYUHj0V/mYHYStaQMZYQsSnZD8IuS7TxPzH6L8xcI5z4H
	IdmSACEXQv0PRiFckGzLVPEdDlZxb6yBN171dumEfy5hLTE05frou5rdrI9T7V9Gev6tram76kW
	SzZ1n7Ovw8tJmVCg8APCR+i1GQnPPLtjGPR1s+wFHsU+bbKNqS1DVHACfeyXIjUTQ=
X-Received: by 2002:a05:620a:801c:b0:949:3ea1:3021 with SMTP id af79cd13be357-9494bc813c2mr316647485a.68.1794562734063;
        Fri, 13 Nov 2026 01:38:54 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:949:3ea1:3021 with SMTP id af79cd13be357-9494bc813c2mr316644785a.68.1794562733666;
        Fri, 13 Nov 2026 01:38:53 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm46458455e9.13.2026.11.13.01.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:38:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Fri, 13 Nov 2026 10:38:47 +0100
Message-Id: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfa9moC/3XMTQ6DIBRG0a0YxsXwJ0hH3UfTgQIqSRULlrQx7
 r3oyJg6ecl9yXdmEIy3JoBrNgNvog3WDSnYJQOqq4bWQKtTA4IIRxJzODivYTtaqKcAGWIFLxC
 qRY1BmozeNPazcfdH6s6Gyfnvpke8fk+giCGCSFBDG6mw1OjmQshf7+qpXN/n6YDVi2RnEHwwS
 DJYQ6RQsqS1ZCcG3RvsYNBkCFaVBaaMS9n8MZZl+QGiIXa0NwEAAA==
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RwehskbQ1DB+sZVbr7CoWy/j61pb/QRhK1GsIRPbAXA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9tqrvAVdZ82kCH5E26oIbCtKVsbN6IcH0/JqC
 4ogR12yKQqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavbaqwAKCRAFnS7L/zaE
 wx4kD/9tBMB1RWvzV6L9zwrExf1tsQ6t1otqngRLcnuO0PCwUAXVIFP8r2gQbvQkDJ+C5KUU1JJ
 mf8aiQsslqKB7OLrZzcF42rWgLWR4OO8fKLBRQh10rWIOSWRXO2Snq+wM0U94TFzr8M/HNBuUj8
 9S1a7BFBO8t6oYPOu/EX7aj5uaqGsy+TU7FI9K9u3vQquTFLCii3GMh5yG7yD05fYBWfAdk/Au5
 yFXfZKmwUqJxvVjthm0qE1V/Z/uU9WDR9iOZhCPfHke75fxbuue8JZWLcoddchVxhrAKQ74l/cw
 Q/6WFFs4/9/EtfQA1OQMYNZ1BcjM8O38f6+rg+x/gwV+XQJpokhxJXN+rzIKbS0RbHRNFdE9Loy
 MC7SpM0tUVfyR0sEo7Pj2FnpSOzBY4IUSR6kGvhOXY7ekGK8QqkYevuls/0w2wdBHZB8322AxVU
 CD0yEmf7ZO0Ep/DO7HSuWPIrahxHOkBjA/afToNei029zXbHACXmTVcIZbcWpOJSF/xD6pblOcD
 u5IP9OQOCihgPabrcIwNNoGVEVXNhYJLgCxiUO13oNaj57KWzG3E7sWF8NUVjz41P29poAgVMek
 T/cqiSFSM+mrn6BnbgMsx6kR30hqZoT+jV1kuwyNxsCiPHT5nzTQRBwHvSRsp9y2BoreTlDRvqs
 wNEoiIG/PqdNAiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: N60MsjZ9pMT7ocGf7JG9acGXGOrxLUzi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX2UYjlTzU42+3
 hen6EI1UzJi9WzaPvGtj4b4lcj1ASS1/Qh7Dlwmqgwe3HvjqjjGbWCXwSJ0IFDbSAfVgSBxJwp6
 gqavd8uhr0FlVGezs6CsKfuRWC7lMy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX0hQqJoR4drgq
 U3xm6/ZFEuu759wau9nl4iH49swFOycK4UxzXE50eyGNeiXxDi22hg+qTOGHLmCB+PNOpx/2pkT
 472ThCbd56qhl+Ah7++lidpVip+ztTDPH4s1/Vo6I8HWIrgW9fxn2HMH5HnLnbiN991zj934Llv
 rmElUoBz+42ZP93W0FAx+qC0AmJbxNjRdC34IMRLcmoaS0BFTkuGotjHFpjdnA19QP0tlwafceu
 Aslm81zbpBmiXFOJnbyO4sgJaPRbLmq3hG3HHk8dtI8oo25vNMK4Mg5jB09kGUknWxmi2dKBFx5
 Asr9tRr3FWvUwLk3vrSG0JA3YqeySxqb2w+JOiaxkqFWYWoIvAP83NZ1e9U4cH/0kPgi+Zc03Uj
 dJPpQ7XX/KMeSRxMrraPpCT8u5tJzXLagV+6CKBi3BF6w4boW1CUrVNLNcjvhC7DZC6SYfAk65L
 0wPH0Ezd26gIcAl5P6A==
X-Proofpoint-ORIG-GUID: N60MsjZ9pMT7ocGf7JG9acGXGOrxLUzi
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6daaf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Mjg7qTZfclGnlj1MreoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130038

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of current linux-next and resolve conflicts
- Pick up tags
- Link to v3: https://patch.msgid.link/20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com

Changes in v3:
- Enable GPI nodes by default
- Link to v2: https://patch.msgid.link/20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com

Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 188 +++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


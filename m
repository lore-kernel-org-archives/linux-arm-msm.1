Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429550;
	b=38TSvW36ywq2IC3S1T+T7D99aN6jEPmAIOnhnG0A1jfedRTc34T5fw1RPHyUS4DLhbbB
	 /e0Zl3IcyMtPoyuLhn85ZkH4O1oIhCJhgkSBZWQ6VanUf007viDb5jcP0XDsHBoM1avJw
	 wb6viiB9UGT38haAjMe215oh6UE+QMAoCIDdbhWkCIEoKHykS6x8incLyisrXjYdmoLK0
	 BJFUOkbO5JYN4N0E1GE2lVDNlWbFCuNa7jHlUZ3u2YbyTSmct2mP7svgpfeb9Q2QceyPB
	 GS0QmHhma0V2GkEjFLy0VJBmbrl25LgUTZFtARwTfdSY0smCeET1rOuK6944lW1DI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
	b=GeNcGdg29QYu1hTfkIWehBe0i5SUHkVo8cfFRD9qWaeuNGc+OpWcEcaoNG4tqhla6Rbw
	 znSIVXnJCkPAelReGqVYNxynFg9w59rKChCR3v7KABOFL9mJr2tXzXepCg3hXq3aZdrEZ
	 XnKzqPpbicGpuT1ELRdFro3OYwwq9B5XTYy5L7MY0wQgr8AvSOtH71glF03N37va3P57n
	 /2XOUyH9gHSeZCxMVkUCNpgsyvJoGlyJGFSryeFTCifW0T4aNroOgXBqi26xmQWXgWEwz
	 oTMlJRR9NMGLA9JKwz2Ejky4UnrzXrx0rw7vCpsJt9PgzQA52kK2CXVjY4Bdsp5mpYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220460A263E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A220460A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fq6d917026
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=PG0catFroHWUpcO8
	1ZieIvVdt7o3wG3I/57gd22yhfoX/Ns9c9eA2XY+mRgEM4uuU2CJFtIdL3huZGG5
	8pbfBDO8D3MnOM78UNW3OwemZ0B0O0YuSoayd5B9CDH9QVRUjx6O5/ayV2SW0XIz
	I2KBPeMBIRKY6cl2KtsMl151L2oo0tR0awxHTubgim+fmAay2mwOrjgBuxKFIlDg
	5GSUbLUG3sJZBX2OM23hyVbMeTF7FUbZQmZcjMh6swqJ51RqE7p4ZPbCEe31G95G
	6vGfadHesgz7OcG58VZakx/85fHdgtyp4pkl6En1lS+cDIBfoH1hV7KSCfE/NZ2w
	C/UX9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0v8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dd37so75699986d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429548; x=1796034348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=TMZSX80K4huuAHvPAe9qssG5wgmUmh7eeC6RQHLN6v4sPudTMA2U06e5s3hrnKQjEf
         pi8fwpNbGc7EE15d0RaQhwABZeHGK2V95sK7v19r3y7m5niLZZuDaQ6Ztuj+qd4B+/UL
         GvWwc7cmE5v262rI4bUpuF/Kl+40lrAGPSWcTDOwkAxHrC0BrHdPO09Ep/gIL6an5fd8
         B/zABLOSQlX3WAp5irnERObJyx+WwVbLO8xluL0CT63LPkKUtrWEcJpworoH+hMcc9WZ
         +NF4f2Zw3QIDTI6MAJcl32qQh3USQ5yKKvX+MwWNccfjGE911AeggC+v2aDVCMY+iknh
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429548; x=1796034348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=F+4Nao066sD2Jyy+++LVtnBycI4JDW3ncq06EXoBbpXG7jC4ZAbLDFp6r71ZJl3q+z
         NSGimVEfASUDri2cXKdq0liZLqclr4OHTwqN6yKl67r3OxIqDZO0LqvdqWuPprQrwcGw
         UWpMnUU530F7x0UQGmtUxopW4E09PMODVsJi04N0O7zwFDTOMkiHr7zUuiOZY6GI5LKf
         9/RUzMb+dJuvHX9Qt2TlZ+P+19qjQhR7FZ6hOdHVLLr48jfOce055zADIFf2TuY7bh/C
         rVmln7vhKybNo/2wrRmu8fxgw+zBVMJgQq2VcYzC2Ixo7/uo6pkmZkNoKX3FzLbNapNv
         F+1g==
X-Forwarded-Encrypted: i=1; AL+hErGHGtJp54wvv3a5fxGZPPZIsxLJhLjVFICNLV9WtcWD9ObbhpF1XLWGLlLbmaElUJ9sgrz1SO7vO7ulseGQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9LFh2zkSsUQrADg2e0mMoBrsSuU3EGezrId4bTRqY6N+8JbFXt
	O93dye5oVVnXj50HuOz9Wu3ZHZ3cV22NyLFqBoGu7j9y4QWCRPIO5VozW+1wjyAL5Rx1KCgDOTx
	wBabv6ipiCHybQNa3vQt0aN1fR3od0Q2Yo8C4TDH1F/4GqO+dBTqzH12TPLWtCNq0SKIQ
X-Gm-Gg: AZFdTZef8Kg24GJ5otHI5M5RxhDQqnwvryr0b6j/yIFYMgmbqgmEbxC1YktXkbiYJ+o
	GxL78b0QoFBfgoaP+mWNR3sM7uAcJ0DM90OqtN11tuIL8enZujWtZoJxJOsdqnp6VUlTjaSMMME
	lfIzx+BpICG4/FPBbva8nUUhA1Wi5SW0mqez3/8N6muIBuXHk9/utXyFs3C8JPO8zFfmrMu6chf
	S4AQrgVT5p6nghPv1y7l01XxnLbz+5NDXeVbaRMKR5Yq3JqUCKBXTzYs0yZ460PKv8Mi4tXcJdW
	GGn0x5YrtBcyElmDeoSfmvWpd7DtAyF+VtMLJodF/oRDpNiwk+/J+4cDRFno94/aweYlsIm3RJx
	YEJ/bsgE3QPs6zL4r88XTJm7tobi0N9QRgVjNrW0AMnwY2kvT6VTVfVHC+WJyyblexOgwqX19NQ
	r/FcW+KtjCPgzYtc2Y18vfx3ZN/3HKISvnczEvhkH/A+hYYjh84GohbE1URQDpP/Ah0opmUx97n
	Vy00fWgAX5noLEemMPjAk7//yNf
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901701585a.41.1795429547639;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901697885a.41.1795429547152;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:46 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:38 +0100
Subject: [PATCH v8 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
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
Message-Id: <20261123-monza-wireless-v8-7-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXw6y88hPafN1m
 Rr6QxJVdlF6Yo/0I2SaOF+TIkRc/IM8+fB6BkQxY3v5pn/dc38kybYI9m9UO49moc8TUuFJhu73
 LTvjYbzdV5fBeRYULMXvqvijx+u+IBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX/GJeExwspLtJ
 vGoRodtxeRtnsipLgtIpJfb0QshVi4lhsFs53CtoGA6ogHbEWllAYgtMK8zadonqJ+b6BEPmMMM
 nQktv7cH8v9LfQLfIXArMfQ9bvzrsfLgLu0nu78d2k0Q9XRTb9I/aOzeVOd3C76X60Woa+wvl2B
 R6fiFgNt1d7sn9Fs3IKA1YJ2jokf+1Q86wuPQ4+7HO625cDoHx6Ogp1s1ntGrR5yYgiwSWDSz8H
 ACIroMo4yRELbfjTcavRKzplP6pcFit8j40M5B59kfRj3874OgDoWT4XNtUbYE9xbzLS/LuDt0/
 E0kQkpawp4TxRqeCLqAo5Sh4pY6uyLVt0lxBHj14kNLb3gTbrX6hD+FUa3TXJpfvaYTCz1YLo/D
 Uhaoo4aqa/i1LY7jcuKXHM1z0dDiIx6lHGtbtvkYyKfHl5uqJUukSJsuzRulXgwAZOrpm/0x0ux
 3ZPekpqefilxTFCrpjg==
X-Proofpoint-ORIG-GUID: f2ZN8PK-EAVMTKyHM4mTUlJSWhscTHfS
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0414ac cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: f2ZN8PK-EAVMTKyHM4mTUlJSWhscTHfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230041

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1


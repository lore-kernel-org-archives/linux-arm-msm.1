Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872135E95C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763819; cv=none; b=rMajsfEEf95B8G7TS/neYMXT7FtCYlez2v903XcQiZviHh/3z+hiDyaC/q0b28OHZ0fLoikbQFgk4cK9eQtp2cYolJbjwZogdaBAX4IpkvhqXIWWoSXeykC1fQPG8vOzJPjghpPRWAxWkENlfnxlMlg7rfBzjl547lYkTseynJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763819; c=relaxed/simple;
	bh=Lg7dXbsjKWPkmEu+dtLIuTi/8F0mqFp8EHzxlsCI39I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvNWVflfJ9PeorGguvdozfF32STshtBJa2y/ICz4VFvJMymsDopZitCXDLJpdfF+tssxJ6MblZfySeTImXWETvah9GsPyjydGpC0dX17QyhF7U6xbabLycFrYicp4DiyMjGYLgsc6f2q1BYSYYWX0it84BjenzxYl6nNNTq+Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0bRzxKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2U0BV+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0bRzxKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2U0BV+m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuosK424862
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=; b=F0bRzxKriPz3/sTj
	2WfrgNYsR+/ABpVIeI8jZe4zgbl+25JRBrkhYloN+vFFnleIHAEvbxW3HOBFMSbd
	Lr3FaX5JPGoBNO4AXNvchMIeI91yo6MGnzYNXe+6vKFvc0cbsfEWWEvQNVQ78EK/
	q2cPluhf8OZ+e9tMgdZXucEsy97p6Bi3vTLqPbmv8W+empWGB1BiIHjCDp6dErEF
	TZsNF4jzQb5NrIMIyEH8wNzERo2O2APJivTK3ngv6Ivd0q8VgtSJ2cW0m7qmdUQd
	5ksvnXBY+XFGK9Zx5ssnRE0DwWxorDryf+eNPLF+Cvy1GKoqUy6B+4Ko1pbJyZMS
	GEvBAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqssbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so16125685ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763802; x=1788368602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=;
        b=G2U0BV+mijkwAE9n0wMQ99F87jOPtBEl31BBYEf6vgbN7zYYqgJdLz9AAAOhdFL47p
         XDdt4TKetkrWnHOd+p1FqFh2/BqfiZCA/0Ge5uDprckr3W+gPQdm1lUI6ROM7UF45Atq
         sY6zJHt6ji9hOQvygqHBAUB00sjp5KqVeNM6oRHL4rWL3ZztXO6aAbJb/dESN9Q86wyg
         Nu1CAR1+njpu32S9ucFF4GO4j6j0QTYEgmKfhTQT6YwVjUtVj0gKjFMjrTN0OuPKdeLP
         gtoEFN5xO7l56nOMuB1mYsxsPSkmqIv9T0db5i6YbDm/zCTBcvyXMnq+qGhgQMEHH4+O
         n0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763802; x=1788368602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=;
        b=G+M2Fj3n/L92wYbUEkO7g6WyO0G4/AXp8mloypYoOGi5ptTnKs9I+Ef8vN/eOuoMHT
         PaRLYnUC40SFUZIma+FfGasjTWF7g9hYQafv8Mi14HU6g0E3jlclO7b6Ro9nzXdM1RiS
         rcRw7nslEMEquKga4u8z3JYoJ795QYePiL0Dfl3sD38Awvfbd9w79Wv4zDtc3uo9z8AV
         QDmcAot5/1qwByuK18BP0rbWOccpVuTqSbn4PktZ4a2pFY2MwjiRvLx9/LwY3ybS6bnV
         Brw/YcO9jlW8r+KxfCseUWBtqYVx4C6+za9NanZo3iA9oVJiBinG3ey+lvnvEcRFFRv8
         k1QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWFFvhK4SlMZjAC96Bi4d8or1twn8EljJAp/0Z2wv/SPGqJX0G05MCOzW/dmHOyBNtMlM8jmA7M3ali3Lf@vger.kernel.org
X-Gm-Message-State: AFuF++mFu48AqeNlhIf6FmoBtYFOXy62tbV8D+gLk87n+oWcHtSOTVXo
	6nYSskYTkSPnlX7yTCeIGD1tznv+OxK9ME/7dv5K9L6E9BgnCWzwp6HmTfMAS9R8OUa3GsA51yo
	4LO/1s2AL0d/T1LuOayWU178N/dcBNRcCj0Z5sCwhhmk4mRWnb0ZewLdVbhBZ/vV/umjd
X-Gm-Gg: AR+sD12EcpMW2tknPeIti4wc5mzO2Af5LXL6LGsrymsGOpknjE+uhAoeKQHF1C54k3g
	knZRCdFfRfTmvs7EAR1fLggSsvd9EKahYVqkGw+tSOUFwR0+OONXI6iRN5r213mbWMZfyGL+LSh
	/0jw0x+qF8xFF5LJzrG5BRh1W2NjangXYs2hjy0svSKomls1kuEhtBCKzjx/keHZfXBK6K5A59o
	NGxY5cwKXqF1g7qQ4ApyQPh1ZIBDlT1HJIz0/aHKkG7jy4rvrZ5qY7k63M/N+eK4Biye0vvFgAC
	Z9ZUBkMY6kKafbXzxfyWTmHBM+mX5UCoF208KvEE0/63f5JFurwKmRg3daYb2WaVLXLGV9HRkGP
	qztOGEDWoXsjGnssDkBC8DEPUCkqhD3FCmPf05kVjpTAS6Y9bY4s+lqRzdFnqXEJKAwzDwg==
X-Received: by 2002:a17:903:4b24:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2d707833c29mr149993685ad.0.1787763801472;
        Wed, 26 Aug 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a17:903:4b24:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2d707833c29mr149992545ad.0.1787763800999;
        Wed, 26 Aug 2026 10:03:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:51 +0530
Subject: [PATCH v6 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-1-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=1817;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Lg7dXbsjKWPkmEu+dtLIuTi/8F0mqFp8EHzxlsCI39I=;
 b=GIIEjwxF5gDLt8j08B+e2UqpwO40cuL6q6UDIW7iwYrh1atZKUMPjOEFGIZJiGVjqxJdkQW2O
 fIfW2rXT9nQAG5baVP94QA21FpyFq3cW+fMYUKBhbuwECiTvLZ2tk+E
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX1HdvWnvCITGp
 LgXFCWGWwnMGGZD2ToOooNYeeETaz58zr89zB438xNSGtAJAnogr9qEicj5HMPMzsWGXBRT9zA2
 2AFGbflYnoNQ3HzU1elBCEmE/yYd7PY=
X-Proofpoint-ORIG-GUID: h4wodzfKz46K2xT8fcAuwHhDnkZ-iDYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX7J2/v9ssZXnL
 DF/nekqq8bq0SkhnFVO8M/a1PxtPwSUSqYtp/KiCUPVuUWfUZE6npCJ7U/gw4Br6OGEoBEyNHSU
 FJsnnNdH4q6mkYFcD3SjlS5itlephiE1R2siOzjuYsYlzpNwo5aSDhDgX1vFtgXWu1TlhZZIKXQ
 PYh7zJCpSpzfYkNwDeyjZXRYL1uxnTh7mW/T0vm2KYjOY7fdUWhU5h2WTsgY9jNQj3Kk4+FToeP
 FYMwHRjzsG7HJK7s3lI1P7Gmyy2V3cV39NaScuWT765ISVFxguFhQYJ0qKehdxdNh/FEZ8E3ZkV
 mS8pZQx1NUX7BwmDH3jxCC4hMWEg4XrJDg17w9TZexZPg+JI8X3CFEo3B43n6QEefPRNEKCPfPo
 GOCu3JVdEX3lWaWONy/6HhOSZkVWiJ3ZtwDwP73aHmvhODNvRd0MO/hwXwUkoKaLsACVw81G38m
 lX5O2LooStsF7wlxNGA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8f1c5a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=L1EOSesq0gyy4kqEYQ0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: h4wodzfKz46K2xT8fcAuwHhDnkZ-iDYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
low-voltage differential signaling (~0.4V) and requires a repeater to
interface with external USB2 ports. Because of these differences, eUSB2
PHY initialization sequences, voltage tuning, and register configuration
are distinct from USB2.

Additionally, eUSB2 targets handle wakeup interrupts differently
depending on device speed when operating in host mode. According to the
eUSB2 specification, remote wakeup signaling in host mode is detected
via different data-line assertions based on the connected device speed:

- Low-speed devices: the host repeater drives eD+ to logic '1' upon
  detecting a K-state on the USB lines during remote wakeup (eUSB2
  spec, Section 5.5.14).
- Full-speed/high-speed devices: the host repeater drives eD- to
  logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
   Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's DP and DM lines need to be configured differently
from USB2 PHYs, controllers should be able to query the PHY type and
configure wakeup interrupts accordingly.

Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1


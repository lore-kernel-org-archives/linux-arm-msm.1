Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002528;
	b=JuW1Upwoo3MY2WJhW2WIB90Xk8WbF2DFZac7pdoE8LXXzY2Hj5FbNVHr20P2MvAIlj31
	 5QmuZNk2aJ0QZBKa7yLCRjWMBPxKgihmDeAHCLqBNLXHANlLuT/XCW/HgAG6LsX5/qd6o
	 VcBkcanChjQtIVF1mIbRh8HM1oY+IR/TZGJGDCuMMCz/v+uhcI1y3MtskXsV362vD3i+A
	 EBQ/iAWEzVxux3rMtDCBAdLkb5SpaQZKYKl9NJBhwFJkxQi1SbujCNHQKXqQ5XggJNFTo
	 h/MwEVsOIohar8c1254aOfKc8Lc11WTiMy6D5wOqc+N+N8a8+LT0WJ4+dr0GnUS0kxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
	b=nB6kLOSXDMUpTTe5B2oAl8kevc3HwQl5sWZecWCDwdrGWxDoRA9izDQZRJCGJKl1kdGt
	 wg6e5w+FDlUOCNYOHovev0rRzvqqCIOOMOQBcK1Ulkyox14ZWGM888WUqQQKrO0ybpC/K
	 gp0Z2vsoqk2MoFb0Mx+66spLPGFxqjsbkbUHdJuQtiWxUMMJoVw4/4gD1XeOCkHJ0aUxm
	 z3p77zv+IOeFpMVGt2uxr+DRleGx337d5EqwQpfr2syrC+fURk4GSrneeGHGz57+1/gox
	 gAojOmFMZj0q0fjQw7yo9siLtOGIIuIIE5mK8bmvBspnRCBX5hplNczU6p1PQGaJMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1B606A333
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 22:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D1B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ht2ki475857
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 22:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=; b=XiJNVLBDT5jl44bp
	OssmIgb2ksplpqtZfiaDYzPpOEbMMuWqlBrkzQ6mz6ezfHQY1WaR3gaqXnU0tmPA
	rs5KZY/F/0QL3Rk4c/MPsrjhFfGaW3xcSvdiFY+mNOMkMzO5WMbeNIw5NxEOE72G
	xL9eAr2HIAAcyBlnrACwJ1C9Rms7fSTSGrtB77awrd1AHAFeVwMC0waQhqC6nCNZ
	/MoTuXMbihZRV6K+eO0Q0N2YtBDI8pq7LjLTTcxXaTMa4zMuz0KIcsVlbXDuPUFj
	/rHVGTjlQz6X7RPxOI8ARA6AcYY0rWkaqdscY/m0RnjLuYw+rnO/PPb3lL+VYRyT
	Y6FvGg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh141-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 22:02:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc1bb97ff8so217062137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002526; x=1794607326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=bAnvmpZcoyFVaSHwcfuVCyiMO9FYIN3ULUrdGJfWTodVvDcXCuCLpEaWRFHvVZYDgf
         KqGDofBG1UOAAeB3x8q1XgRQJxLJ6HL+3bsYzI2q9RhLmDQ2QXGmlYBfqhPvtIM79u7C
         vG4kTVBFVKaeDDg+bi4gpcP7pPyimFlwvfRoRJx/FrT4PjOu9VEz9W7Fg2E3/4UEsrjG
         J5Nc2ORQ/lDYe/zGkcxgfg09f7jWs9lTz4Sb07FYG8enzfSCe2jTAQB8+KVWVuJKg+Sn
         HhBjntF/MXKASSIzDC8/S0zvan4l3b8HvK+snUb9hK0RBznD8RWlzu3ZTpFrefxudTTm
         nR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002526; x=1794607326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=PDatqmobIf3DWgGaYlVNp9Bz9XLdYH6PKhtJie6YdpOgh1LS4lYl2VmzNiF7g1Npg2
         IGiMQPxxh9WSfU0UQUwzUg3pCm0uV5tsT6PTzFGvYtL4BLrfDTjNrQ1XK6PoG2zirK0v
         Inms1tvY9Hv13Z8Yg8pT96NoOHAefOw89Gx1EaIe9CwK9JWnt2vezCTvsdrTsZ1Vj/3d
         Ver/ACq9a6Vb4u6cHhrp9mwIBIh3oxuAq/vQ+ygaUjGpBT6ttBxzOr9qNEodeSlKHMfN
         CKQMfy6eZZZcZ0h56yvpAkHU7hCe9PYF99RezCZ1+myS9Fgi3rkTCEzNUXWR9jG3HZxC
         ExAA==
X-Forwarded-Encrypted: i=1; AL+hErHTC3TcrXC+/axq4Z9i05WeDwXmCPExKaiv7NJ0d8XMOQbB30bk36FWh3Cy21s0K2o/GrC7kRIaQHn2uCmU@vger.kernel.org
X-Gm-Message-State: APuU4Z8n1a23YW3FEngWMDfxTSk7lvY4i0m/6wb/K65iPdvZJksEZrPO
	TcUm090swI9MCTiGERp+wqMX2FonJf07OW+K+RQmCaVa8EOl/IM5TVnsQoPVjhr/0uFzVjuLK2P
	Ls44BnGIThGx4K+7NMXPM+mYuOC329HwvWlisWXY8zit0xkbAtSgt8FqOndnkYtAhmcfr
X-Gm-Gg: AYBFou1/8qJ/p4STji4JFCNLsgMfuaHC/PH7eFdNdoY8NbSVlD6VHp0OuBZtR4lXEvv
	iW1mMQCqny9LeHplgWqffiD18VuzF9j/sVhc9mZnY+BgC5wCH6P0rtUQd+TqVhPEYeoYBkygJpt
	kqVflJVXJ+LMluVY58zP5ylWl1j0FvMdgkefdinniShJpG619isK9ZMip3fS11puZ+1WdWFAwpd
	hDiabZ01I5fxzOPy+nN9dIPajUUSrMSw4q06EoqobR4dBsjB8m7pwv4Fi+J0KxBawT8x7RTe2/p
	uoWAkzpXZMipO4qaq5lx3QEVuXlbD1vRx2rEJdZmqZUuaSPEDFddEon1Y5PE7ipJMRp/YNgseLw
	5XMkIE/SbVOoYe1dpgos5HzPpsxDSa7Gt9GHR7VYtzQwvBoxReEtUuihZyw==
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974138137.30.1794002525649;
        Fri, 06 Nov 2026 14:02:05 -0800 (PST)
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974111137.30.1794002524946;
        Fri, 06 Nov 2026 14:02:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:52 +0200
Subject: [PATCH 1/3] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
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
Message-Id: <20261107-t14s-gen7-ec-v1-1-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SyrZGulKp5uKF9cAbNVl8Do/c1rZ1PPSYOPKrxUG4DI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5VQqqtyCWR+3Z2Vw8LNnei0jik/HGY3Q2v6
 R4ut5BUaNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVQAKCRAbX0TJAJUV
 Vj3BD/9QQoX7PZ6Ph1gTJ6BzTUr0AadAkHUwogPJ3ecCwHFO66kAKQ7sZrmsgQ/S16zlOwsqhm2
 IWZ6qhZ8zlRa6WkNNli8diGHHnjDohSj4fGMrx/vVx/K8/xGQKhsrhmAy0V+a7wYncZQQjWfK6D
 KF4ZPQKP7RqWyPUwFagq+69nnDwfLW0gIVMRfSzM0c9livjcZb0w/K7RSM/GuoUngoXxOFs1BC4
 J+iA+5ccZxS3M1Le+DrkoFhgYHbp6qkaN+voc30CC7D0C9GOeU2Ax5jV1177qUevr6dRb0/KrlN
 2+8bzlF9pi2g756etklwNzkkJFAjexTm1A11UtR6v4M17mYv0W1ssfK+r81llDX1VuD+4SpnKvi
 gp4EapyZhZRVF7/yGqEObxfAOCwCS5TjnkY+RqSxiXUuF3rVvTdN4oXa/hRUSWDqHXfNLJutH2Z
 CBz3QIfYNdlu683QKfCX01T/kA1JmgMfD2e0G71BoklFefWbNbpRsry9fHY2IeY/tvOkgN0mxv0
 kEvgBebZ4bmzYIq1bhLOoUlrKXJB82/HRsXnhzNmaFK/Fw0qQ6m4sa8VVQpU3vIksKs69hvaUkQ
 qo7kA6gVATa7oO3F9wOMb2AT2UtlaRgOedlqQMw8PvspOlAGD9/8fR7xv8fdi6nTp+n0fV+Fpha
 dQZ5ilkFibImSSg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: UiSWLUoaV31z0DrJnlywmD0wDGUHCyOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX0mGMnKn9xWvF
 4nowYF6QhU2PG8/0tbGcP20GOyTwgQSkjpwmqV/yrg1tfsAK9QEzLb10k/rzcJ8jSvTfU6NgNe1
 f8X28smTB7H1nZ71HvG0hiSsIb4bED6feorn2cttSLXULMfI2cz1fzUXqrlzv7h2YmKVUKV/BCn
 30Lcb2AcVAyKwxb9ZfPzQrP7GogfaLvi8iCFLfPXyT7pcDSSFbGsyrItbNfIuBD1x5kQFBsvTTF
 n6vVgkOmHq1bMYgR+7vWk8G7F1aD299B0olu3aQZjXTCQtaEM4q0d6wGaLXM1bh+Tb00MwaqdPH
 pm4myN1Zv6E2d1wBVkIBJjxUwggyzzhW03zjbdl/7PUDzfwYzGQiX5PMAqePXAXwY71X+gZYP6g
 QG6Nh1bBW6KVzfNPz1B141dugX8YeFbKP6rbeIF83DH6dIh3nvIZJxiXTLU2iy/plFmtZjrKvMG
 tOKgPbwwtXLzQAK3LzA==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee4e5e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX5R/8Td7GEvIP
 8fpawKEFZViVJWxWyRyDKVYS+HI8NCC1YC7L4ONz19FwFuLIA2/6EwJIhMLxGANdmC1PpL77Fyy
 4njWxmxZwAGMs7xhO75H1pzY8Vbvd5Y=
X-Proofpoint-GUID: UiSWLUoaV31z0DrJnlywmD0wDGUHCyOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..99e5e7ae3cb6 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: lenovo,thinkpad-t14s-ec
+    enum:
+      - lenovo,thinkpad-t14s-ec
+      - lenovo,thinkpad-t14s-gen7-ec
 
   reg:
     const: 0x28

-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174219;
	b=F5VwYn/kz3RickeUppl7Ut66Q46ZofDFcYLXQ3GGn7KKC4cHmUGPMjEwGdinxs3TPHRI
	 tZOIZdSrpOuYzixdSJqrxDE86zxjwNRj8mdGuOYlcnNjZN3HlBq4y0pB64Pw5ubB+XNcN
	 emW6PRFUl6jXGA8Le4mtCiQFUKiF7Vvo6gfyikouIng01P0qnOokfu9GAD+hmnvPcbQ0J
	 YP8GmHUx1/+v5YnLI9QXjd49prMezOerTR2yRtx1QZQi77/wpPErs0oFSe5Y3+4uiimo/
	 emK7c8Kh8Bjh26IzoZjzLbXtx8RlElnUwtjWwmr9i+Hsaak2F2TCOa8pFNTJhhQLkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
	b=dIZdtWxKZfy80NWuVAry5drjPhhMN9EuV/ykdJMsCYCvaJJp+APALyrieF/o8kGuQ+ql
	 +pe0s0iHmGnuAEwHiYU52dE3r4ThjQ/T3F+3WRypkTjj+VRkUaosh3dHBb0CduFkH5IFS
	 apfJVRL9tWz9nt1YlWoGYMlY+dJ0/GME0NhSxqLIx8NMt/EmCAMw8Ewo+eztvrM90AtzW
	 9nAe6Kx5iNUfnSMnlq48rA1kYLTQ3JeuJcO1iU5JUbtzK9kYTYoZz25w4oE8qSzRO5AlV
	 DkmrtzDaLXdkgyYuZ/QHaQjoC/eU3FpoWUDyzrI0FsjTd9RzFM6besayU9xWug51ESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yqm1bdhd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxOMiJ4j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86560A2610
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE86560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yqm1bdhd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxOMiJ4j
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjw9u1528606
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMHdIQH1RVqwJCLiuFphR3
	7q9Xlf8zGCHKM0i5zGed0=; b=Yqm1bdhdZvZkCa622KGaxaYhEJKt9KXlMwbrg1
	0zC4l64a14wpt6w9rXQEXvEx4+WdfXZpdkrN/IlpOK0UpDErrdbvPP/AcSB213eC
	0rJzc1Xo8bvLYuzqvr3leEQxs2GILSZlGqWJ7KwoJcsoSH8hZrWNb20s6QtgpyPj
	QrC9+zI7JWjsaRuuwwuT1oAArhoLYoWYBwgdYhhNYOSbt/0727MRYFM8hCm4lyuD
	hSbJVweixYzSICpnVO/ivQaRjdnaUOlnxOteJufa6awO4BKfyHnmvUhCTVzssEH8
	C+KM7pkmAHqm7Vqc6JQTklcU/czBUWNsyQOoAgABs8SQv6Ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsjuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so7192615ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174217; x=1795779017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
        b=bxOMiJ4jJMG1WrI3u6aoqzbT7seNGedwiR/uxEhywNWhTaYAQWFVGLjBCQKunjQ9sD
         Nf4y93SAQEk9/1OvAdxSXXT8IX7k0pMhpfnmWuavAYdYunKQG4rlZsDqea5tClMP3rQU
         7eRFzqQ+YfJGlDhLaAIuM+jr7UnYpI1e8nSE3NmsmrGaORfSNtzIg/3eLYj/uDzmRaEl
         nFbByTfy7LVf73Tm5RvCTEUlVlWTSAisfjI/rO9Ni09w4owngjxMSrpocPqd3+8khqdQ
         bMz+hl0wTewakQdTpoLFOutPLyrKQSZRDYlXoo8cCYGyg7zfQz1Z/MVgNv5IGqpXsq8O
         FgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174217; x=1795779017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
        b=GNPchTiG6g6cIBksFN49Y+/sK+F4gRLhvxZyFqXN77Sy91tTCBeIMBkSIK0effdheV
         j4x2hul7dLDkidQ4KCLx3mGO2HmLB27B7Q5/msMqK34LFfUlik/Z8WPTElS+xuNOcjIL
         9CoNswL6dSMYSlYQgBt9LQ3OFywZeQtvx+kFcpk9lKS5X0wVG6bn/oz/yJ9y7muOdYJA
         KQ/H6AEWMWLOXy/l58Fy8vFPOdVabm6yiCFzvLZY3WnHqn+oS6mQ+AhvXqHh71wazXjm
         EvpwjPK9SZVmNH6opxMxJ0ERMW8fvMi+TGLWDP+HBnbuAE85tBb1nRvpx8Rdyez3AbQl
         RVYg==
X-Forwarded-Encrypted: i=1; AL+hErH/KXKpRxg5feJSvfKaGFaSrHC9elvf2dFscbuYeCxA3r3zVGJK98zAkvvkfsQPpdhw0Zt8qnYs9yiDAxL3@vger.kernel.org
X-Gm-Message-State: APuU4Z+m9AOJzOgrkuUIwioIFG8Fm7SnYDkYfpSbvXwhMZreD6Sg3jQc
	aJhbxzDFvA9NGhQrz3q2oYRGCgZr1Yfzbo/A9UqG23hqmf0eM7ggQ0dnr/U0YrwrTtA544rlvXT
	Z30wWIwX2pdIIxuALhe68pWO5I2YwkxyT8YUX0T8WiXiunIHNGo0DLVWaSLavfMSFluTu
X-Gm-Gg: AZFdTZeTV7Y3MR81FAFWymuf13TlXg9aTxijywbFHA2ttE6015fum4J7/kuWHgOcXmj
	TwrOKB4lYqWg11G/gJm6qJn0yHOA2QdsLwoFtp5P60YIBdDgqyaKLEZf/yGwRr0hn3oW6WK5n+J
	3qi2pa42ER9lAKOAicUMuZ4dD0Hg/eWKT0q2ZFlCFx2/VyONrPQ8GWdGFyr36eLEai1TudRgMTa
	YjroobxOrHMCP2/To8qSk8F7ZU0wmjsXWlfNswV8DY4HWeBeqq9K1AAx7B6e81ojW1cOvtAZrxO
	ktvzmyYA5EyE4emrEaNDFJeH/kWxEq6Ntk43s3J5QAlpcYuQR1nqJoFg+lI0ri+uXUWkMjovrza
	rOCjTRi59qUZbAk1ynfUY9lrxONbuNQnXBBtvV1AUweH8tM4albJCDzKPhHUX8vDUC92PJkHDq5
	1dwTc0gUE=
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr28437625ad.18.1795174216621;
        Fri, 20 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr28437285ad.18.1795174216130;
        Fri, 20 Nov 2026 03:30:16 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:15 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Shikra: Fix qce configuration
Date: Fri, 20 Nov 2026 16:59:51 +0530
Message-Id: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC8vAGsC/3XOSw6CMBAG4KuYri1pS3m58h7GkFIGqQpIC0RDu
 LsDLjRBkmaSv535piNxYA04ctiNxMJgnGlqDHK/I7pU9QWoyTETwUTIGQupK83NqrTVkBbmSUX
 EssgPZJSonODQwwJeL+Dp/Mmuz66gu1mZO0rjusa+lo0Dn/s28YFTRmOlA5nHHPJMHhvnvLZXd
 91UlYeFzDsG8VU4FytFoCI04JPWeIoNxf9V1n/xUUkU+FxGDAoZ/1GmaXoDi8qIRlEBAAA=
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: rEfTbjvy_qCSrv2BrfO5MM9FhOscxDXp
X-Proofpoint-GUID: rEfTbjvy_qCSrv2BrfO5MM9FhOscxDXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfXwWsl8T/A8lHz
 /XMWDaVGgZ1Bxh5v/6osxnYJta15cs6DngUkBAzJBaYlnkA+E4nHqRvnSiftHw+sJNDkzExagr5
 +ufvxfUkc7RufkPrk+KjAaI05D8wkyTupvo+aGo54afujM8PWgAiZax4SNbuIw0YuB4CTOemxG0
 juXdpqbTtymE3eZdeurGNKkZP8H5HhszepnsGPgDGommkw314pgm6jsfwUha/STL26B6NrJURnm
 p/zawEW+U5QKLzr75UVWHqsKtYBBXuK12+fH+GmkTfdS0/JflyPbzeUx7g/wTkGXJ4JujIOUMBI
 QTrvkiYMuAseUxO+LbbHb1YiqAHhpWs52mmk7rCmThwBy6nda0MWbHU1VPiNoQ5SpAZqhMDfnmV
 nzQXZWnMPOEO4OWsTN4XPlw0/kdEjlMHlPMZOvBH/+Iz3LVMHvHzwNPPrESO2K5Sa3DiYmAtwxp
 IR3aQ3d6BJkw2pGDHuw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b002f49 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=2l3kZstW3bczaa83jWEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfXxZMEL6AMT0GB
 DjY/g4zY+fMCiwnL8GpoMVp0332y8mQ3R2JH40ZtSIhwuU8wl+ZW1ZolOk2Lx1mFOuE4kUu9oTV
 IwkQTKWm/9Pxf2WYYXvW7SwM1cw08eE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200045

Herbert/Bjorn,
This patch series fixes QCE on Shikra and targetted for v7.4.
Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
backward compatibility.
This series updates shikra fallback compatible and hence, both patches
should go from same tree to pass make dtbs_check otherwise patches from
individual tree will break dtbs_check checker. If dtbs_checker is not
blocker, then patches can go from individual tree.

Bjorn, will you be able to pick both?

The patch series fix description as follows:
Shikra require explicit clock which is omitted with current binding
description.
Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v4:
- Rebase on next-20261119
- QCE should explicit vote for interconnect as consumer.
- Link to v3: https://patch.msgid.link/20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com

Changes in v3:
- Collect Krzysztof R-b on patch 1/2.
- Update patch 2/2 commit message.
- Specify merge dependency in cover letter.
- Link to v2: https://patch.msgid.link/20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com

Changes in v2:
- Update commit message on Konrad and Krzysztof comments.
- Link to v1: https://patch.msgid.link/20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Kuldeep Singh (2):
      dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


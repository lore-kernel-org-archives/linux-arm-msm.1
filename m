Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3E3E3C5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326025; cv=none; b=tgQp4713oseuteIhs3BUBgZzJb56PCQP7VmAFMJtW/q5+eOaOj9xIqG8J3Sh0wvEm4owt+nDnbB+Bv4EwXEn4z+3oO3V8qN5SfHc2LTS0HmZmthcMsFprls+R5fzUvhFQSmS0HV16LvS8pO2e/YsW6JctT7qKIjwFUU3X1XEAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326025; c=relaxed/simple;
	bh=SDLAqJU6hsXEIAGdaMzzyy+lvvs5/IK3BK9h2abrj4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdNUjKCXBZhSgmDugB0ilWPUpQw+Mym/nutjZCoZxwLqJ2kis41VEphco5A8j4oUVMJYil1xy+wCpgVQvTVxOKTD+bVx6h+GT3L9GGFUi1jTnZ/sREt4ic/mC0TL1WsGr8tFyI7OPaTHN4eXiuruzWxwPLBtbxUgr3y5GMBsSPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRzH6uzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCcyZeTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRzH6uzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCcyZeTQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yc1s289534
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1
	NqZiY4vw=; b=DRzH6uzng1YWnxG7YzVd5pkw4ae9YC9HIQifu7l/CqSksO2ljEU
	e4D3kqCvbV8n/kKqnk81aDFoLUscTI8EwU7Dqg23pheeC14EtzplfgSwGcciWKWn
	2zn+KWrxe5GFxKNzqjCx4kOtoazbVhOOWwlnnNkAtbveP566PXMX80tZnLUqkuEp
	0La+GbCNevm12kOLiNQoGwyk2mCjT/dJ/ibbQdO6/RiLX14qcQgicjEOhbT8SK7w
	gA9ysad6DsTGB7AjAEraLdZcC+/Byj7hmO/dXXaswd6ndWu/c0/OyuQaZCUFgvm7
	+mQ2Gm4wKdu6YYtRZy9gmw7rtLowsO7JDEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881trv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so136393285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326007; x=1790930807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=eCcyZeTQ9pE+1SB2/DjmNoVbIt4Wr/ndfasWYxlIWXzCm13MjNDSbgXH2WQJWjkgF+
         U8K+9UOopZYPNPvjUXuGWhXjXtj6UnlHIoRqH7uX+G4G5aKQ921olnCd8MAZp6Tv0Akb
         xxGzOZzEluEwt5E9hHe5XOYGmJxapnFTt0QrxAiC9bkli6SZbqC70EyW7xgHL0xarpSI
         gxZTsO16o1VAw/JZh80eEeUGYr0opl9DzDmqXpAvKPzDCm3MErjPp7NhqNA/nUIJPmlt
         dLdV5APuyP6nOxZwy0IJOWm/FVaPvDfVOCVprMl7i5pDwIirqkNBSgTsHnLgxdBWxNji
         xw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326007; x=1790930807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=hyX29Hs8T6IVHdOQ+hy4GlnQbp+AvmB8TKb9b4hMBAa7hskJtAFu+u80VDMOm4uAs9
         KtxMfcA7kpND9HA1ZMrpcsGuLXYkQN4ENwQj+ONLgax8DjYL1QIl7YcHSVZ5BanDR5ya
         QMz+JXguV/QEPrerwUixq+tTrymOugoPEbemhPzd6hR3OVNgMaQDfp4vhsPgoe54MCqE
         9i70neh5rXcVEyyBTKWZfn07rlrBSC4nHhlBxWwXFKTelTgISDV9JZMgaKUv8ScmYD4E
         +kfozI+zEYO2E+5kLgkuxPChcIxYdPdr6BMq2vH9UPditsKTmaWe3ScqXpFsSjb4DgHj
         qeTA==
X-Forwarded-Encrypted: i=1; AKwUvBwnOqpQMqlFFG1HFSwpNkjf9tH6B+wITGgUmU7oD+RN/NQWTaXlse/Glf8i/I4r0jlHYpNt2jnP7jSVy0nR@vger.kernel.org
X-Gm-Message-State: AFuF++mM7deybDascXjzqWltFyl0v8Fy20DmMjuMliJOPly6UNnC0ujc
	2Rao8WeXTeIMlAcLwoASfiGOLDTX5DsOrW76tQVTtm6NFqVahmwEMgKjGXGAwQN0TxXw/JuxaJM
	Zq5bI1yVQJ84uxD+ZVhUiShb7Dulya2bwTyYIw5lrXdQL5bYqRS1o74SLl4mtTObV8wLD
X-Gm-Gg: AYBFou2uxOPWGL1kiJlTc4l/gwNHfBdoqP0CSEvftTDQn9fDtqNu3/UI2fKQyZ2sH2L
	Lxy3MDW4CW/zzxIZGXvMSHQHnUbp2ymHLSEhEk21J7XxixQF083rUvKacm4w9CjwRS+du0rsctI
	pSNJbH9I0OTN0yNBil3OsP5K51odVwM8KGFJkYQMy3D3cuVqOqfCN/k9ahispa4dx7LtSpC1sel
	b7tGp9teSdD/W0xJMzc5uRnhKh+JNHXe+o5wu4nlxjqDyn5n+u47jiNqUH8K9YrGf0Yjtf411jM
	IJv0XY3z77b0wYWkeOXghwKK+s7owVvKHRb9TV7G4i32NtKCyH0G5WDCS3scRhnSxPc2Jhtbze6
	tD0TKF237xTCZ
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337817585a.34.1790326006964;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337813685a.34.1790326006499;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Fri, 25 Sep 2026 09:46:31 +0100
Message-ID: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab634f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qxLtA1zAx_OvAWKx6QUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX4hRHmZEoBIrc
 GX5WFalXm1tr0abPRjwzz7WeYtxmtek5TvIIDM8bpYRGFtjHuzVki0R8VGgIztZDqVqyisF0kio
 asY70Dbt5vtiUo4aygLbop0YymkOenE/XyoqklU4Jfq+R9gxpJvfb7IyzSv/Iq0lfE2ymGV4AL9
 Ndc/oNMmZOaVBxyARUm5WLV14j1A4qWwbCAtd1vnURG/LQ58k4xvj4Dc4LPZwBtkGuoR/1ZA4t8
 iWhR/fjXwvCVLeg7syLdLXNOkMg78VhAnYRqm8W5G54qIkCYcP38yAgbVpvO0TVqfwDw5PLwZnZ
 PUpuXfT1nIyS1xntQoRLwprOlXeQsUjED9ZXWx0+NxqxJaJv/w/sCNiP35KJFg2ERvFh1Az6TOW
 Fnx9grHkEIsCTyQvlnMNxwGMC2xb1Pdv/+f4+IDMsvZHOTCi3HUcisLehDcINa7CAa00tRfEUtr
 gfwgTUBK701duMT+YeA==
X-Proofpoint-ORIG-GUID: QY98BknmF_BFsU0ZfWgCwu0p3cWg2hob
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX5BSrLdfisTi3
 7WmnW1RuSAonSHCO2L7A7VS6RmoS/xnBYE0/CJC1JcYLF7jM1rqXtdJ9ptkPdcRLN5Q/FLOi99t
 G2Ez7Asf/HUKZtj/qX3lWPFTbFP4b3U=
X-Proofpoint-GUID: QY98BknmF_BFsU0ZfWgCwu0p3cWg2hob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

This series adds the two LPASS clock controllers found on Glymur:
LPASS Audio CC (SoundWire RX and WSA1..4 resets) and LPASS CC (the TX
SoundWire reset).  Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya)
- 3/4, 4/4: pick up Reviewed-by from Abel

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 +++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0


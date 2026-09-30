Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77824DDB3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772385; cv=none; b=OQYxeDf3xFtAftZbW3M4kf8ECbQuPFHtDc8NbfGb1aMA1n+diZkxeXqlNXQFNgFz2zCzZ2/N9cB7uynHLQfTPdMomaR7SPzf0I5P6XFHexonGQCDuALqeP2OYMAtRwmHrwBjWck72tNg3JNObw6fXUZt+0VsfZxHkQpOT/ldnCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772385; c=relaxed/simple;
	bh=dLk7fWdCBteALwvoZRaHU9oeqXBvnyQuhJNHQIKcy48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJggeYMQdLAsYKgb7D+xEX8WrKH+CszzLB7dJLKWqp2DEnAX+GLN2YTy1xzBx6BDcnLUmUSVxWwgmMtlL0FVY+Par1C5q8POrnv68F/A8qvHiJmwtWpRY3wxG6lSf6UVf2mdBeH0g59etrFLEonogvMXSCE58Zd1BaGj8EUTC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqfTX7sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUBsTJIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqfTX7sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUBsTJIe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8LhO2898208
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4c/LfuCxFPo
	u3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=; b=HqfTX7svJQrBKUBq2i4H1KAizP7
	+vtBPJtmvY8oJ8PdCWTMhhQW8XO7ruatv0+gQqFpdn5q/1v6dmJUsZI4vpOVj6Qd
	2OIQM3Zb2dlXY/cRAtNOCOfzUEOvfQt4oivT7Xilbn38uOx8c/y+pylWIUIz0Ulm
	MT1jEOuxdCDIPX+IKhmsgGXeyQJ5wx8+615UtuFO8HsHneVqZJjvGiX/NUxgRcJQ
	oA7PRj9UdaUZnD7xtT/j4x+SfbITyWFcNFpUs5D5q+XcTvYJnMqJbZGxWL7H0fPb
	sm4ORB83gOqU4NVEWh+vr7rsD8ONvdtuykmxJnr9WmievdWs3ZbIFeWr2wQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn298j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7e1d8bbeso421580241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772380; x=1791377180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=UUBsTJIe4kStHVDl01KDjm8hDQ5/9ibWHUTkcSSzysILZw8KJw9LcMB/HU89IoeJwo
         ulyFQRlwCcCON3KUk37uHXi3eWzCiar/8DT3f7cVLiTphG9/83kNuRac1mHXRDUfjvJp
         0yRfvK07gitGzfFJzvnP775xxmn+LFh9avH2QKxvHbISTcQLffTNKxiZfJDAYzHCNU6P
         D1acSeSSPL7NUBPv4M2pcbjVdjyjUYV4HcaRx8oMgaCXznkj2u2wodnaNDBq800ydtA3
         c04icwfmX6ZcJUlgNSzIkgXlaudqZudBdi/YhSBOjzvo+W9CE4zrNfILGwUwmWuxYIjn
         BLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772380; x=1791377180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=WGBJ47joIL08JI0kkvP/zVcN83HPhz4m6enDUFrD7RQCLn5zzverUCVYQHap3DF+1V
         LB/+biwm9o07pa2Fed4bil7+VqzD/T7MrdE/7f0CnxTpjU3CkvxrbvsVhMTGPbqZpSVn
         PdxOKF3yUsuqXWRy+x5igdlddkYW7BEQw6DtH9g1OqZPA69knj44N/H1+F6DH9sW8yJ3
         +JRtHZf3ikQt3WrM/BT++CgLmqF2rrqFi0/kWWWnAjzGS1gytm9Drwy+xg6v3hNTC4FD
         5SAIscZ5SEW8MLsMvNmCkXSVT4rUy0WO8zcEU5uo4m2ph9tfzs1m6RTsxxsDjXpjcTQ9
         pGqw==
X-Forwarded-Encrypted: i=1; AKwUvBxwqgFqYO++nbZ7UTecION6ii7PPNL7kjNKKpoHwdRabGJhsyE3pWe3znXfQiS+xfhBNeKQ1sjfpoNWEujN@vger.kernel.org
X-Gm-Message-State: AFq9FYK5U4dPv+eZVPAoXDX5eiL4kF4pJfVzatNjFRwf3N5vWPxm92ES
	4GxSUzBb4Ej9EIkg3IwFi2aLG1aS09SW4QlSndx/LpCSLNRxGqri2nqhoWf9I+lwO2uLPi5WXxW
	GaZ3lPFIjuG6/Lw+AnCgzzsYTYYDzVUe5cW+2hddm+c0CyuWPsxvORttMo9rXsBK33fIj
X-Gm-Gg: AYBFou2EOKPFXD2TaoGxTU7hmyeSa6ZmBed2ZrlAgb+NLn60oNbi1mRDjqDamSULoM4
	NeF6XSnKnRa48I7lzMc43bn4cmRIrAFwP/wqmmNI9I0NbkbJz3l6IO68R3phiM8wUfvPq8BoUrZ
	skS0ganzqC14EeibDmulkrzjjgQ0CWVQrawmZnchkGW+tlaeYr0fFHI1TtQvbHF8XcP1+Al2VhW
	b1j2IgQP521i5LZxCK7I67TisOvdS/yKfgW/LKH21lUPmH+pJGpYyl41iE9u/2RlBNYavW08SLh
	CfRaMG4U3YcF/lPPTHFrMCMAlBe7TKJIrmiillcRmvTSYiKBvfjxinYn8PYd8MHmyUCfzHgYW1v
	Cq+0k1o7qH7Fi
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188605137.4.1790772379727;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188588137.4.1790772379200;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
Date: Wed, 30 Sep 2026 13:46:03 +0100
Message-ID: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd049c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1S9TnuZ4X9D0nYt2MHYA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: dLALpVTRBbBwh_FYiBq8lF5n7hWLUw_U
X-Proofpoint-GUID: dLALpVTRBbBwh_FYiBq8lF5n7hWLUw_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX3nkuR0Wt8JMb
 krY88QJ2Hxcy/H/sGwg2HqV2KqBwD1ULCg2mAlzOA3Cvo0LG7BKQ+EIMK1De1asXcJhjBy53izF
 ujHeT+XsviHbFZcQM//bUu3zkCYSRDwvVyZW2tPnTWHXfaYUrcpMgk3Z+vg745DxDh0naTNZRBj
 yT1GH+562BEoQeupHcBewHZs3l4ivd49Qj06XgHknYW04ZxvqKZRycCwoUqlKlG2QewLo0Fyz4R
 ZLoRIUmbpOJ2L4bqyv1eyzV7Hoffw6uKZVlc3Wz7vQbeYglEemI/+bGC4thxRdIcqk2glhHWv6F
 bM+BHU3945Z8b2H9PWbBEgBMr40zfjoZkJSlkmMv8AX5j5A0U/SQ52bGIdUYa1XHi/78d9X1eI7
 rew0XqQXHHglUGf9aYA50K0xIqgZbtgnoPSmdA53tGplz6yLx5GYCLR0uilbqhsp3JVfnaBNj0A
 xInSGPuLnBawqEJgARg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX/cS47vn8x1/A
 L+luKp3cC5hHwJ3k2rNvalMVHoIBxfcE4Q3W4AnFIhK4uIaRDx0bfavpf2sszy1Ys150SKcvmfq
 93Ue6vmkjpXuO6809yYydqMX6uekYfo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec
support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..7a889d888383 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0


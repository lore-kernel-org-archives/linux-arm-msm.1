Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0B81AA8
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884929; cv=none; b=orK9f7zh4KDA0Satlt/UJY2hE3rfDvo2WdF4wSFaloLIpmp9J7V7uE6CJzFWTztky7/KhN5BQsYiSA552bKtYiT35C9rA9lh80NJtZAVnhC1dXV2BZeaBSSzLJz+a0akS+EeM8xAQ9DETsUFrRf7EKbICfpZ53V1qP51YavLHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884929; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiybULHhYDbsaQxJk3zqJ7UlLUztbouf6t1m//ikwCEaFE0C6K/2aIGsjBRGk3HanKfcbzV+BDOwiQtF7fJwQgW5VlqhmRaYSr0zVSXWWb01vxdNmtbGXAYjnYylP4ERLlQfUlVMQJ3tX4L0G4r9tdQltlV0Lm4ldnrBDNo3FLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqVj89h2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgSA0qAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqVj89h2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgSA0qAO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgDHQ3765257
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=GqVj89h2azKQvz1JarD657vOXqi
	orJZmSvnDoHLZ53AL/4BrxOKaTzoPkX12ByyQ78tnUd63tjSsDkjaONZ67BEyoE4
	YqdgHtgmgLLh/g7ZUUpWpfNcMXCcbbkBqO31mg+c5j0eFvYx2oVIuNhdM+mCxg5j
	8Yp2eeguIEMwcOBLwNxC/2T7AcWAiqfxU0MwuXd1WyFECkcbi+P26y3NaQzmsLLG
	aCuZmmxWCFINhwjKxj92PmpxFMLMomm+ItuHzLA2CuyjwVkWD82oxCKInIQ3rStL
	/mayszTwjjyP1u/vQudb4qpSdXrvIPgJcel0xKwtWKjhZK1q7gH/9xqPNrQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwkdcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so3289392a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786884925; x=1787489725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=IgSA0qAOlSO4Z8zv5ZsJi67L29pjzdtR9B2PKToKuOlKVD1jvQ3PW+vkQD4goJCnLB
         O+KREGMTYpsmOp4EPCpnAUIwQ3hU9jGNPFzSXNbuvFZ3XlBd3LKK7wwPzVDG++gj2mXd
         4p9srgq6k8sG6EqYJkUmUHOtcbea7hoUuQdlrKOpfymwmrP8dF+mhpsghFYzAcQr0mck
         vWvuZKL47EPTR/QnI/M/XoK6CIUxTud2+/zh0qz+e1kxrH6MLHwhrJyihUDYKsWTfYvd
         Tl1TwGwBNoSPyEAENA/wo2AQhz4XTLnl1bzQ7SiLRUmELljwhOqmLIxoS985fZmnVRCS
         q1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884925; x=1787489725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=N/Re52ZHuwgn3XL6pRpqSVM5xdKbjK5dgLRDrc51+p0XMA4kFR2HWUR4C03HNFOb0u
         3jN1AS1wjBDlF5/bIyayD4SLXyxCUAilGYsC0LTAsPLILvraSJ6Mlyp3xkNFHW+fs8xb
         5ANlvR3w0jmGATwaefU6piv05239IdfKdgakSrijOLkXsEOkHZW+u9XALNhyqolHBOwJ
         F4h8lp6IQkmb8S8blHC9BUmrCyx0UU7bStqjNDe/K6Y27k0QpS3lPX3cGtitbpFBb6cf
         pbgViX8xYxkn/KZ8ChNmMrTdzdD7hHTYeHdsYRFgYcJTjU4pIYmyt744xRhTzLloPRNo
         B9YA==
X-Forwarded-Encrypted: i=1; AHgh+RphG+m7RwuoCh56xAZFXckE4k/fjc7err5bqydEZkAdkfkfOn50/KciTDOVDpHO0ApH6xyRAK9kSMYIHpmE@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUm/XOxJXhDNgIYtLiCDDV0WnwmVGgPSrw9WCAbB4Mg1lm7GI
	stFMiD4KSlb6OIQSOiNaf6YQoES1klqWHVKygMkNYjYD4aO+DS9XvqapmN+QwGrDp7scyB58niM
	hFTN87tWLeRicCEZmizkPiQf0ixRgqRRKuJsJZNfYR0JAP6h7H3b8a6wrQyMWiDbgSWuE
X-Gm-Gg: AR+sD106F34WS5NQDV6gmt4wIqVcctaoWXfflYfwInU5OEiR9ZfZYMqxT8HPZ3FWCkW
	0qZmBk7jVWmYweYt+CQb9LDIMmDpc2CiNj+QRDObNv/hMahdJxuEXzlVbSPGB7Md3W41oYW6S4Q
	1tavYo1nTLODcLfDUBwW5udN7K9cwXRRYuDyCa2vHaOfg8IU0YRzn765Ye9Ji7UeNndLwXw9CJ/
	pt83XK4qouI5Xk68/++lqwZWOVAYCkV7N8lY+o+x6zQ6Q5++uoNrMiW5/nsjZk8MIf3as4KQzzp
	Z4TAVy4FvHoJe4BE6Ql7lGZjEeqQ7UNcs5lfKa7y2BiIRMXI0/C4wEMN6fmj5Y3xx8yMjA1l5pr
	L6ldM1Ee0+bCt6P+iYs+QFB/Fn0rojAx8Gv9/yOU2E8hlDXndVnBFOkh3bOqj
X-Received: by 2002:a05:6a20:6f8a:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3cc71e5512bmr23111376637.31.1786884925514;
        Sun, 16 Aug 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8a:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3cc71e5512bmr23111336637.31.1786884925005;
        Sun, 16 Aug 2026 05:55:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm40072703c88.15.2026.08.16.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:55:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Sun, 16 Aug 2026 20:54:11 +0800
Message-ID: <20260816125413.1635150-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
References: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HrDixYpEtEZz5i0J-ECHxMGrs5iD-nNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX2jk6C3pRrCMz
 BoJJZag86C/nzvXGy4lEh+7rt53LKyNXbuoHfBscIxm1QoK6OlrI3beOm4KtsslJOq7AX095WoM
 b3VcmwPKfXT1vW8GfxkMjHoldW+ZfF4YfNJ2Mao9pL83ZaogBt0ZFSHsvx+zILtLNrXWzXRmbei
 SlI7gFkgGhw5r2Siz70/phb3b6msUhvOJdcgo8QsvzSfr0OJCMn9sDsbqNlZzhOfkr47kWdIyRX
 ck47HaYKcVLOVzt+o7ymi8BKrKTGf7QPIoKzWePxt9klIWjoDlM+pBTs2Wvh4Cz3mS5steRJ5bh
 ooxSSine1RZlHY82TlvKMvQa5ASCrZLIK4vIZv5bJf2wf63aDPi6OgQek4a6Z0SbCiOL9/1mRME
 cbcurK/zsrS1khJAishMH8EvG4U9lRONWBFjfhIrLqO4IR7PD9Qr9/WZ/Ct0XQYTnkZHa0SXQj+
 sgyDO82AxIJGH+r/2PA==
X-Proofpoint-GUID: HrDixYpEtEZz5i0J-ECHxMGrs5iD-nNe
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a81b33e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX5gJup/HRy6M0
 lr/ThFkY/zSLKEdMCUvk0StZ9vk5QW3NKhvBSADrppnnHabVuLBg/xHYowc8L3g6KOcxborQrvk
 Ws790L0Mp4i3wehYgxw8zO4RxGabfVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160101

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0


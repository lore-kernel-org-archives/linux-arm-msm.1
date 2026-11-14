Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663224;
	b=mEG6ELHyOJyOqq6NlZDB9zDUxVE6s+v430ST/zo6LuzcXvT7mnxj6bCvJdR06cALCbo1
	 DbMfzPP4o3qR/6dfhLgvzXwVKsA5Z2pbrZ4J0HzVzZnVrU2LOhy9OVz/A3B0IYIQ07Kc5
	 6fF/GHoeLi7wk3TBHAZAeC7GKdnUa6fSYW1uOlVL/f6bgHsIHRJ6D1BIwWIgrKbx7T0lJ
	 9CcANK1odXgkyFvb744OfoHISHqTG575VQq3kMxyN2CXzIU87ObC7TLLV/ZYLmMBEIeKY
	 LB0wbdJcraRVcIB5CtVAUrFYPUGrE4MNUN6FLTkFr8O5kGh+RnFxNTmfDxEWU5fwcWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
	b=w1uQp/vR/foieUpKwpMmz8KfP20lmKE+gRbnt89n0I8hyNcmkeGLMRxlTYc2Eqqw6JW8
	 8FbdEuBx8Y0zjj4psbjQMrkcOUerZSp/B/2ne9SZBZ1a8cy82N4pFu3byoCUF+7uYuT9J
	 pYKQAKaJj6PrxEvIK0LkA4kPm8LMfZgj5m0pnTEEj9K9Y2LeyiE162hsU5yx4Z34rDe13
	 uJXXAg6xk8rc0dFV3FWFUPbZF7RNFU2ndxX9kCTp0QaUXnVy15COkWE0LMIofYbF48QLb
	 NUGlxNHzThxybBAcLodNsYCmzmKbfJXUxbo6CHYGvj5suCVX0qSP1lFsb+RPUqq4dgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BQO/0gRu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40B606A33E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C40B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQO/0gRu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9x31k1751493
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nRY4XoPC/fT
	Tj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=; b=exD5LrBPfQi0qNdb6I4BRaNhOp3
	OpCMep8qiXqjl7rBA6UErjuJFw0Fle/b7QDuf9mxMSoNRBoZxdoArsR8syOqcDon
	bB4POUxsS6wZ8hZiDa/5dLPeSQRol5JzujwKu1gvXTtWfbxyBx9+GojCSg7NnkWx
	YJZ4zCjWqNExQhY2X57MSPrsXsaJ3i+BLqX44QiMk6US+Y/QKHQjbVcJGqtqfrtc
	DXZZ2rW0hXxNdaK0dWTbW76sTkDk35F2vyCdGC/fkGcv6pJiwrsOxe3f06OeDb7N
	pkMLURkkqgYBxXy1PbqNzUYjVnOvnS5nWp8s9cYXgg5BOY4hvONiz2+YVTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40v4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso30823005ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663222; x=1795268022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=BQO/0gRucqhW4IomlG+Oz1sq1pXGDi1v2mrbLE+b0tji35SHvhAq8BbCGYBns5/N7e
         Qdic2RS0XejEdLXGQjcrDJ2lh2ujKvniS0GqiM6o0ZpZwmuqqVxJLMRC3KBeNeqK3pAS
         aEGJqz2eX6fRIKHQKeaH1TBmLbNVh95NOmZ4MZjgvXzFh/wzL0biMn0XAIyS4pEMPtJJ
         sxUx+OcKOo1f/Lf68qKZMhfaNwzFlkFBf+rqV/Ikr3BlJLSAVnO7KPZe/xu87deDHroz
         qZRnNQ/kSPZe8mALARpFjdm5uzS/duLLmkdutMcW2tUKIntTkB+UJhIrRKz0lAAKxmXY
         l9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663222; x=1795268022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=d4CNz+Rt9ByAInZdYGC1/0TkxHWhY1tOxyR+t850PAWud6fXuZoF567BkGqEV4kHIt
         rYrS21aas4RScESM49QrrZteoR1jA+araMcnvam0rhTXuvaxYtchJ41/TgKI8xDVvyEa
         4W8i8nIAD2VcoH1yU24Z6YbIqbGkihz/OFu4+PYNbr+j4ozdwRJ/wTvhWgC5qeSDzysq
         NMz4zXpY0LyPH6cEBEkg9oK2xk6gFeWHg3Ss0hlszQcRRUHUz1JToH3djgtz3ZWm+reB
         nBVWP+U2EGxXw5J0T+rak3je94k6YkvxVn17oPEYYRjM7fBI8t2yL8u8OGHHQkIeOp8o
         WJMA==
X-Forwarded-Encrypted: i=1; AL+hErGyqpmHBQOpq+ip/YPAfR4v24B10CT+ssCVKB9eGBDir3X3gE+wh0UAzSWrIzxFhcjfu9eB/6nyrAETk12J@vger.kernel.org
X-Gm-Message-State: APuU4Z+Et6QMnyGyIZOKorMB0qOA6QIqBKaLcgRvbjPmo18oC4QjPzWm
	fuv2feYtnr9lW+X1F/78L8ZL9Aw5oQmKKdML6sOl8LzgvDnpa5uPRijOlMeFyanVZU5M+tjsljy
	vBHqe4Mgdh5QbfJ9QtupdWGcVJlynMpkYI02p5XCtFM7poirD+3dWtZ5gkS+AEx3L4PmO
X-Gm-Gg: AYBFou0DI5sqaHWMlR+gg2/Lw76Jx3/Np3IVzqTXnU2Vg+vEjxdRmCLJlPp3qvRNt8S
	EQD9O93FZWRwStyeFAuS/tas1SBxLK0kDjmgIk8PaPTdZJnuc0Y6geuz52Px8wcSIvvUDRPFSAr
	WYL0G9d/MOQUBGo2OavBo0ESsdl+95N5yXPQODuvNdKPR0HN1Q9ReoSJ1P0tKeIkLK89+KQcYyv
	jvlxJ304MLR9EnbBnIqNqT1jaIovBCxFMtOsU9l8bCZcv2CmEiiUwQkZcZzhGoF+lcGPObc5L/J
	Tvq/7bgjBPJPDKHEA3cyC+sqeKnA962fE07z4YlJipV/BXj0rTWhyUtA+LT5P6Rt/Fehb1ZGIkt
	+laGddrAcTqaS9PMTvaXjc7HZ/59KWQXIACQLu0eek5WwJX6QlUTUt2t/c8NGZ0TxGYXuFZODeZ
	oHkQJlvkZxscB3wFcKRynDhbSAJSTPfQKhh8I6
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752855ad.1.1794663222345;
        Sat, 14 Nov 2026 05:33:42 -0800 (PST)
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752655ad.1.1794663221893;
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:03 +0800
Message-ID: <20261114133304.989635-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXzczFMz1CthWs
 gPiQCcG1ShuBSi+xGnYgs+TIvG12sw695EvC6qW9vFlk3ZdeDwrOGeKHXyjCB+Qwsc5D3fymOlY
 du2J7f2nIAxoyl48XO+ZfNTMMLvTlpaeA6e6dZRG56pX7E/pksSGJl1Men4gCPBnLwQhGtTHWpo
 kFUy5fKxqoR9xoztYvbIKCL0C5GPOpj8jq9tOvHjTHscgE31jrkIT14PU+cxaCKHY2zI17HtFMT
 TBdUeP4FGiQ+XVzDjqHpcsj/fjMjBIgAZ8D5Qyxi015fI8smJvvXg3klQq/SPIHp1vUyaJsZZ4D
 nP9w6EoojOKfQxCbZ/E7zKtCiFORqPlMROy/LeL77fcfh7ANkkfzDH1lYe4fIkiQnWTXdh3EAOi
 jG/SPT44YkGrakNrlI35EPbqni+2n+nzaT/VI+ho8/vzX1Mvi8omNvUN6AC4HT5fDEyxXEsAAPj
 5trnHIc/zk4DtnH1UDA==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af86337 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BXiulqRx7wyGqYsMR6YA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 80-4mslDMiYHc8L-Ra09r7WGjCFjY0Jy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX2Py6ID+1ZeKn
 1so8hSgo+OzNClCFvmEQaWJmXCeDJ2pya8Z0CuJAAC2OPOrqG0PLJkrmzA43469FnfouMMYFmFB
 K8dFiES7Y8bOA9r+rjGpVmXqnAJt/SM=
X-Proofpoint-ORIG-GUID: 80-4mslDMiYHc8L-Ra09r7WGjCFjY0Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

IQ10800MD is the Dragonwing Robotics SKU of the Qualcomm Nord (NordAU)
SoC, which is used on the IQ10 RRD board.

Add SoC ID for IQ10800MD.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 5e84c5a7666a..5b8f1c817698 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -320,6 +320,7 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_IQ10800MD		798
 #define QCOM_ID_QCF3211			801
 #define QCOM_ID_IPQ5211			802
 
-- 
2.43.0


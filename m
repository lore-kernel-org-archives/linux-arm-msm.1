Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E4A497B7D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363829; cv=none; b=d32QgdQJuMe4ilrNt8f9lJcqqXUXJcxoTHD55pNoU6VAtLc0P3kDyPlnbqv1sdg9IwCtl9wKCMU6UZYg0qHIidfmCV2ws01QTB+jf46SxDUGlyOrGX2Xl/YAgOvf15atpukxN8b3fmdPCa9Lqx5vDNWM+WSVOwcEyvXdbOBuxrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363829; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TeT3tRh9dUx+Kzrlr60GQDJyCVcVvyKlS0f4IYa7KiWNCL24aMTiDyZwx0fb+bUMdfc5HDvfHS+HtNck832li8Y6rAcNZNf4tuJen4vmfYShLcLw97AGXkJPzYXNGUKvlUjCR+VVyEcOp5SoNfZZMQ+cUMVokZ5wg08jBEZNIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOmRH/to reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOmRH/to"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jiSG151958
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=XOmRH/toX8dbOpqKi+tJy0eUIgx
	txR6mJGJY12YA+kiskNqv0gDFgTQMQCdyPmz/rCp7Oscv/BVmLq72CSkqccQIOov
	I00NVHEy9b2LA/7vzk5nPz58ASsujhZxnrmJRrZT5KcY4ngkY0RvO512EScACt9v
	pofvLfI8XTaPoT4NkCr/lLr47w1FBhMpYdfExKoRPB0Li4Wu01Xye9UZqxYAvYe5
	9CHAVhpWmtcwQho97pMcj0NEoO16Dn/8Agd/TAKIQlNct3I7Km7m8E+yqJuYpXwN
	Q19mMTgAalFuLKM60Vll4W7kAPTIOB5Q29wlbJFFaLbsU+e3IuZjkwc8RZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719c5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so778783285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363798; x=1791968598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=JImUj/oRATo4yzcIJo/BnBUoQNAjt/7DY1xspUsC3VJYuw7mAv3KK5Vievroxtxc7w
         961QdB8nbcZ0jIQ989sB48e17GgsNyhMG9etKqMt/j1Vwcw/l4H1C5orA9eIG9KkIcah
         Ncyh/p40YdlTo95aH6DT/yoRAc3DpDuF2TVGK2wUvIQP6Zz8sQWejWpx/dGIDJZWNFyW
         jkF1nWw32fDdhlyPhW3dfrABhzTlS6NZiBmT2Oa9ei2YD9h4wvWXiB4rRRa8gDvN5IO1
         nZ7s2u+iX0nDptGgwsCp+Z8X6EoNES703duqdD89rBGz9UfMSToRD4MY+ksEBOq4NJjQ
         da+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6soK3J95+F6fHoQCybUrId3VqttyOIhTETOikdUBinxkQeQD7nR5aaRVH7Tyc6DWYSJOMwpG4mB3e+lX5@vger.kernel.org
X-Gm-Message-State: AFuF++lQBA2IsnfaELATZmHW3AkFrU6MSB7Y23kfP3QD4zZsAFkhl44/
	wfda3fKwJ2iza7L9G47ecwjLjgRKZCHBGWqvSUZFNvECuQ4/LT+i3DxsmTk/Cf+EtZpjobqXN0r
	eKuyrHi/xHCE3rEWOC+Nu3Xz0gvsw1R/29M8qucuS8nlYPexINhGZ/A7yPS/Dzo4OYEez
X-Gm-Gg: AYBFou24DlayjTRDRmYt0NMVU9XgmmW0GurxJ4I0nvEMnQjIVeGTGnHt7AkwsXvd+5C
	iOQcfJm/s6LRuAFJEM9AfvKsqvJgORMigI5o0dP7GVTDFTojQuGXUB9ZxCdSMqP4duBEz4vK8gc
	lN4lvbG7j8lNthluYeVezZZNkB0eguoz3G1L7u4QtbMp6bBzYJ0O0mzyaGcUwuZ9kBmyqyKBCHk
	s/qSDN6PXVSbXvulMjG/HPBsNJT5phXriwGHk9Zcs0YBP/DhjtXLfUbNW30OYuAyn4McSWPnw1j
	efQNeySQIgKtSPWmCqSJrYRCZDOB6jRUxb9Jv3BvUuIt1YeuuGkpDFZi5lQ=
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311435985a.31.1791363797581;
        Wed, 07 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311428585a.31.1791363796962;
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:40 +0300
Message-Id: <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/RoJL5gLjEkc
 M2pgRFj0cpRadf6Zy6DRC9OJZa8Js1ek9lv92zEwY9xkidaLjjTsOV/OJZ6Elsu8pvyjBnOMwhX
 HRtOdEyhB30VXhJWs3IEXJO2IX/+hqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX91rhsxoPchPT
 GtLgjQgoj2isgjMTLToHA/bc1uxPImnXsAuxOzTTerWZzZ0k/F9AngRQpDy4tBcnD0ZnJ+xwQUu
 N6k8qtN+tE25C5FswUQEbibjUTKKV5d2AMsHPrKqfeHYdNBTYCYvg6IqdiIsv16LlkY7/Lt9Eni
 +lriBOh3f661tAlpHNJjDALlqZf7Fq9+y+qSFDwIQ0Ea7tiBteqVyZZzG855RqtA/XxTRHVXyxY
 bONPFH1FPfeR/79WuNMlgT9JZzSS2ucVeU7R4Hiomt57EyagvTekuRFtGMxEDkl/aOvztykuy9Q
 ycyIDEd+OK/8NAfVqE4CFzFAWFvDiF8xuz/wiXybqkB1AuWl2B9xQBYW3ldbBoDq7f5Nq97vNSM
 yRY02r7SE/Q3s5Xcs3WMVIT6SnCSQxhDN7kRs28sEbQs2me1gRn+xKzpAIBSyD4n/xdHcv5SVjk
 Mdck2HXzyRfCJHUjyQg==
X-Proofpoint-GUID: OnFG9J2n0iag0qwtFMZa7ghBX6vJFCll
X-Proofpoint-ORIG-GUID: OnFG9J2n0iag0qwtFMZa7ghBX6vJFCll
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60ad6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1


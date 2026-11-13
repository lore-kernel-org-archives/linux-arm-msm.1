Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548036;
	b=KRZqXeLWuDyjjKTkV+TadZb5l6b4pim5PIhxiaBQTX+sBebu54bwWh74vrVzvvkAhR2F
	 0qclMp99ujYR7nFhPqqxy6qlhDHjyPHK+z05Xa7GW2Qu4EmimPeW0WEb4pDQhZi9LL/nb
	 4WFqG56WzKSU+TEAW+GXtYMiAFHG7GBeyx9MR2hvWmEvaVFs/o5NIzESKzPi/33SQ+BXT
	 VXrj2EQ8T/LuPxhGUHqYItkshmcQ/OqYhZqLnQITxoqZZ/K8DidZ3cwAuiC55HepOCcB3
	 3sPsCUIxDDIGwR2xs+QHlKDG/63+YJvm893uyoU9kJUHECLVAtwGTaV7pid/mhSfLTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=4OzVbngQYISn0XDbdOxR5UFaklDBtKtSCVB3ooDZdSE/dcVqcAJ+JxAqx3fNf/6nt5rz
	 kyL54KKr3nJ7zpnsrQbPiOnBC8yLFUIvq0wi4p5uMpe3KFoLUKGilifpjUUc9svqGghzf
	 GMSSlo0UDmTnM+2FEmOr9WC41/WHachvG87yuhidxI3JcrnfMKOwPm37jd8K/fxvvTmpR
	 XF7stwudS4Hx4LI2NVuDS8rHm6Br4XcotSb0P0Mryg2CIh13xNuW8gOU6Jr3jcxaPhlT7
	 GSL98mCSkO3WnjkOG9lsoo3fZo+GfXvy3wAGKacLV+6RAA6Yjf/VMnT20RjrqhwHxRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FFF606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD575ST2619582
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=ZNmtI40XUta6mwHm
	mh/qAmVhftZn/DZ7DEYWNJwDVyzXJj/AIxB8PBaOfRhN+Lj0JUDUig05+bkcCgib
	splyu9LROvBf8WJOCxWFDSElg7V/34r+QfFdwUh7hXcOyXqBh38JOYJRprbyp1kf
	dgY0ANkHPVx8FTwukEAcE0x76NajKU69gr1qrkv49oVXY0eA/Vie4Z0eEtd/ZXsj
	xsJzq3hD/GGGzN4aX7/fktwgM0R0lM7t+r4U/agZ0vUAIVRe5WrYTsrYK0TylbYK
	h0O3GOHIgeTydZveFR2WJLuvmdl6purKpUuRuxYrYQhszDkHl9XdAwd4eHmDKKMm
	a+CeRw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mraey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4ae40674bd0so389529fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548035; x=1795152835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=cb5+tIGQJz4623R/7xz/bpHAhS9P+r6EfKAEqx0AjL54rkmhXVz8/wBoJlZvTQGIxu
         sqJ9mt4y4xmcEyk/4cXpgKKLXCMeL+Epmq+Cdltyt4ADcTJdq5f/u/byLFxsssq7kbvj
         zF7Wr92KXZlpL7vy22Ez6UlMt35XDCYHX1qHmBthbCepKK5StOZaugbAgv1YoqmU4dVF
         nPnOuFUdnRCgqRXSqdo4/Gp8HGbY3qUyc69iYGXBOrlWjvsS7PPZFRkI3z+BqV6EHswp
         YYiKwC+m1F5B0YN5mSr2CLBaGi0QA+QiVj6h24plhDjhDCWKFICwD3JZpQJBJVT5MM/T
         GpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548035; x=1795152835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=TfmVTIwh53PAHuzou3MuM09Bfw6/7I/qYaciwl1tXbxUcjYdVba69GQli4EhOLfGTw
         dV3BlQSuhYhR4l2SAHSboLjOzon18SgUcMgpKUd9zqSKs5TEQH1Ht/JG71jJ97wUgF6z
         xnzerS6sULsYFOCsHJz+9NbEW3ihv24dnX4VJSxTQysRIqKH2XezVTITEX8op+UNbmfU
         imtJkfa8TyeZUsKJICRNdWodgHyWSY7kCh4cAgvtjqEmY7Sw3pVq4xXmcLT9FD5+qjR8
         gNMYwA4OFvju7kvIgBpnvN8MhGpErQv5sCmd4anSVn5sgGCwTXpB6yLbRNCLZSOgfDi4
         Ntpg==
X-Forwarded-Encrypted: i=1; AL+hErHEtjWdT1AyJpJsyh5yac6FTmlmTZNBoK2QFTlL5d+VJiIV08Hd4XYNU/7k3zdkeSZ2jegDalgxWqC2MwCP@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xmoa+kpKQM9jTruMX3pZjblL9k9qa3ysydujOgsF5sHtmKVxl
	mW9vliD2dOnkRcF+QBYmuTES2fIHBzGANIcPKp44CKQ4f69JvUb4BLeuNfUJFkWbG5TJgUraNNB
	2p87w9DUt50c9oYdS9nauCqap0CoDKQSGk1U+VM242Uv6SWkkK2nKHSKiIL8z1Ay83/N7
X-Gm-Gg: AYBFou0iMhlCwweYH7m7bAxoGicMbsCYiZproZsvJBj7f7Jo7W52KcGi95bjeIQgKbu
	f4UtlHgr/VTIJZNvkx78SlXRd//yWD0MzjqfI/jauRQGwUl3z6voNS+do/K2bOpGcNak5IomVv+
	eQPzlB8imediZPywKkOdLIrbD+1GyPC1urRw9OF0nJRZ1z4nM5iuHSsCp2p17I0A9JIAa0kvv/z
	pizFSLOR5uJBPCN0c1PDvAFjH+pGmUQQ8/n8QW/nKWfesWtT6J4YxyuepuGzPe81tZkkVFdqfRv
	tey7w12qKRriZKGcVM49sNye4NUuj2zr1maqw1ZSa+0k2QrnO+xou0jcDrsOsNbKzYA22IilkTe
	C2W/5rA0xle9Wy1X1yAAOxVMm+sUm4lPJcdL/ou1dVp1Nme8Gh42duNOTJlnRLHIW1rY7bNAUZC
	Bk0+ZyWJHlV4awHpRvbL7CihD8Jy1lmKu1wMd0MPx3JlL3aL+hV1Q/oNCq8gj/
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423588fac.20.1794548035167;
        Thu, 12 Nov 2026 21:33:55 -0800 (PST)
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423571fac.20.1794548034659;
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:33 -0800
Subject: [PATCH v25 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261112-kaanapali-camss-v25-1-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: ZcoF1AaDIjkrpWVxldotGHjb9KQQpw6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6Vugv+07xFTY
 N/HqwdNiPbLDXNpwAcEseyFme0GTN+onOk1HaMR77gFHfTya9tEhCcqP008kEdGp6suyGDIpEKZ
 3NAR0mA+UoUwxN1lxV17t1AiazZaWAWT/NC2K4nJeP9lwnT6jorHRDyAvGbqca417QSASuWFWYZ
 36uwfCLem5o4hlyQxXL4TUJkuHwB5fO5MoOLwPVMnJnsKZjf9FavSSovS/bWxtFjymF7QblJOyb
 zKqj81PuCCvSs6G2jl6qMA0xw4GrX768LuJ8r8Zc5WX8thj2jFWaqt4X2Hk2Mc6U9w8btCAlNIr
 Yv6mAlG5bV4t/z87CSTXLZG/YCTsbuG+PCQGmL8K/vL8UpsG2iMjbyp103qKorSXoQSSZHudIxB
 Kh0xEgBxQ9mRqGJob87eK5W0cFwf/3t7fPp1uJZHOfEcn9CTly4POvaJJc4r8U0rGFREsKeyyck
 dCkC6uc3TlgIbF3/ugg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6gfDmfQ6gnxy
 LAN20wO97vNdOQ6QcV0nBQPU/oC4716Rks77LRYZVcJnzQ4qInaBadSuWe6PYogfAcSiYGwKBuk
 fPITvtBjb+C60b7wcLrSzDVq9dpoZDI=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6a143 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZcoF1AaDIjkrpWVxldotGHjb9KQQpw6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1


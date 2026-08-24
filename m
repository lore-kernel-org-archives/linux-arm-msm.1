Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866F4195DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572586; cv=none; b=r0f2Efbgw/a0HH+JaXyUYvzv0m4e6ukpcOAbHlF7IwtthSQ7k6XEG696jLKFLLXhHiZg93/Ab89Wxsek7d5LKVr23BhKSQHQ60sBPIEp8+LbxMlMuXcR6BFsempuQAAeUM6PYMLovRv2HiEywI5kqdVy36w7WDeD52dwKY9wHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572586; c=relaxed/simple;
	bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAynumFNLmz5HWP6Wj/g/9GKzgZStrv98chZnGCcu0cc8yVu6/5f4/QEweyY+C1UFPe3RLkZ4vAx+fv52hk9oD1g8bK2AYH62hkVOJThEmnGTF1sJj17F1aab5aWzTptT4WPaO6Gr4wNj1lXtfVyXPZnx3ThwJEW0Q3ZQSLBnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjDbyoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3nogHI0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjDbyoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3nogHI0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMc7J2275080
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=; b=ICjDbyoq+PDKm3Ul
	u1qUuuIIhRUbOLqKz2Tvkmk07VCNDJ9D1fv31MhiZqUm65TWn1O1v7Lrk76ABpQ9
	iPG7Rx3kzmfd/pgYe6uMWy1Bs0GJMaKvG/qU4xPgbOZhVN05aLa8O8yE9przpxMs
	udGYKtqUri+mefE0bfqRzqb5NbElLn9cFqLwcdcj2LB7FWzUC+3QQ+wyE/AP/EVa
	CnM47SZFh4A9ZQF1n9M6hu76UhMB9sEO9UL4pqE44dMNkPbGe9ceUf2Z+O8WBMpL
	WkD20siuC9/TyQsCz9SPtWvVZJpivdmvVgVNMipI3MJg6nq5cpb4D/HeyaujjBpy
	0SSzcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsgfp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso34755241cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572584; x=1788177384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=V3nogHI0KBmubJ3vpA2shnUWDGPTu8/VLgC3zuMZaHTit0o2+6MpYeMHC2W9o7XfMp
         Ok4dJrek2CSjqFWcpBl7/dmbEc5g6taUf/cPemzBX4PRSn6TT+xskmIJmurTjImXnvh0
         K6CTXU0I1a4RKWOowJnyc4Mp3kZR95j6KfaWTY7EFFY4RNtvC3Jh9eZCX0tkg9lT1P6k
         OPi2wAhBAjfFj5bT6m5OzAthgDeBTFdOx6lxzsycLCpo2UDHqf6ErZuyoIyLY0F7O6SO
         nSi5oE1RSoP0nbZreNPgpQQyYQb6WCQW9+zhiXNCNa499Ot5s1bTtc3BA8Hr3PIca25R
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572584; x=1788177384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=BLEH/rGnviT49VJLUnuoG6AzCGaaCMntqL/0hfwHCjPVXNhooEPZb1yYmABCTmzhva
         SWcmSqY+CZ67MpsbVVTRtAmiTGQkmxhdO2gXFNCgAl3CTsQG7dgVTYt2vWdHAutc9HL6
         FCn/xw1/DwAT+eL6ZzzthRH0xO49ItlmuIkuA4SwEnAPjbsRoPsdiB8aja9ydu8hLo9/
         ZANTHVP3xD4DUHh16tpKDA5AGwVAjPIzIgyB6TIZv0LejnWgxLev7A0fmM5EU1NJKHSj
         cOQyErINzNe25ikO6KieIvSjrXHUXoH69ryX9s15A1ItSVmKprrJU+EmVkT0XosTyAYo
         AaXQ==
X-Gm-Message-State: AFuF++kwOXRCV7kwvP2362+qLvUlpxbaPJMtkWOVH4H3Nijkt6k3XOri
	PI/eOx0ylvq8ntMqZKQQkOXMTAFsqTaEs0zcmYuw1pA3m+oE/zJysMWtx75kG6wSJo8jGG6c1Xl
	rJkmA3hpr9UdGpKB9HuC771gz8ebxYyBW1svfu/AepFipHaA2dN/whggkPPlkhL9q+/w1
X-Gm-Gg: AR+sD126TlhMo3D2peJBOhlSTzNRqFc/4nhh36snX1NLMWYl85plLFkM3oozlxzhNh9
	z4lXAPOK5q+Q+oB8dGCTDfS7m42RhTJWL0mC1wyoKCxKkPt4icN8np7k/9gmL8zVGye0x63XIuX
	f2300FQfTX+g+QmR9Q9sRrxK6FHgKYtSYe1m5slGDpEUe7XYW7iks8Ic9hdKNq4uLmIlKDefQrF
	dnJs76N92bMv8z+fS48VeQWiTl+LvWfjCy6gk2WOhMAw4AFPBe56kgEwN3GAdGnK6/pwMUI/9dF
	wdcMWnECDkb3CnCWXaOPPZmEwbgCPpa3dnNWeSpT5JUsZD0s4ezNtgl3XgDrAVRXmAFEM0lAwy7
	VGgFMB1As
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452491cf.1.1787572583868;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452031cf.1.1787572583076;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:21 +0300
Subject: [PATCH v3 34/47] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-34-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD2BQ73yLRCFOKLr17yDz7Ay358Q5lphjkRs
 RfIqKaGiHeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9gAKCRAbX0TJAJUV
 VoQ4D/96nz5DGjGvRDpblSMlp5W2mZvvnSKZP5OmQm5j7yywF8xN+SpJp8JW/ZXc6YeuqQfHquS
 LLabqSdcs47NT7iT+GDSUwHCyLueq3gU6HxJCpdQq4Yy3hyYuuYvLtpgdiYKzi6kMLJTZm5QY/l
 GMU9DQui1JhEqho+3qh4X+3TJuLbqhJBZ/IXUJEUYkoTg620VYcCn95qrgBm9LNPjzSHVBR5LEe
 Hi2yEuWnNXO/tEBr/jfNqiJo/uGF/9SAQFwYrcerGS7mXFSoeBLeEIw6BUx2y10O+CN+pZz6Lv4
 SHbqeXxECCycOJbp7OKdMqqW/PQaDTtDNCaS04kh4d78NjZZyRN9yYZMMFZiumc1TJH06FBjdtG
 MKWlPM5dQToHTbAwh9XsTZtfHIE/kmXsYNo2RRL0awMVuf/eb5ZUUfZcgH6H5mKRmTyiiuMy813
 aWTETGmPvLtylomUIBFffp2UrltArb+5zkGYfjV71fujgsx2QsXYoGIk5FqpJSmgJ8bNXKnWORn
 DLYADf/Sbjb2mMO92N3dHjz8DDvKqiOepvvniFXBvVy2kyEWkFFZc5KyDUHIKDSnXSOWHLsmY1c
 g2NFMPFH37ZuvnWJK6bOfaRO/XB+euRRbga2c8t6jIQQOE33jr32fFLLZAf8P5a0Iy/hlwwHgGE
 TCb+lsJ1xjH8C7g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0LmspY9qQOfk
 rq63D5qu4X896gYt7oXQTSvYLCQ0pcworFQ83H5ZxN+VceC753xJLwzgk0UxvHBOHCMtuu3xy5O
 ewnuYH30D/LiDT/3YlW4d47cbwT4mRk=
X-Proofpoint-ORIG-GUID: rZmvcDBoyXUJoxeT7WOj6f7pEAOgONEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzY+BmZtNGoQ2
 NF0+Ffa6Q7G7XgqqiIxTSYKlGqF6K6+8buwDcmG2sCMviGUiGQ6lRa09upJWH3p7wxE05kQPtdr
 jxe3jK7pzDdusd77Edle5S1oxJVpCUP+UfsOWL+RLVZAv1t08SgVghdPJXUgJlSYeb+phoMzhO6
 FN/8tKsrMr/Ku54Il+ZbrktBCfdvJMy7Z68JBc70sDya4hrj+6Sc1XBg0m6ZbhKSQx0umhzBJAf
 Tu6bHSLuAK65jd22JS2fgLvQQS7iN6Dc5P2oUgHjCDVlR4W42NalOPaJX8IjB9YEZGbiQLDNIwZ
 R/gSx61scjQy/MvIF4JGCLSfRfOizsq/SgY4xjrzskP5wqSMCBlm5CIxqJzp+lkS2WUqQAg4SdN
 MJvCFfEkOyqQOsE/RHCgB0v4kd1qlsPXvk7/xvoj5S9LYCS+pXnPlKEIPTVVt3j+K/e2fRXnldU
 pEVJ3WQWS4oE1lK250g==
X-Proofpoint-GUID: rZmvcDBoyXUJoxeT7WOj6f7pEAOgONEV
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c3168 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=frXxnpyXSSLf7P61oFUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GCC GDSCs on QDU1000 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..accb4b989655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd QDU1000_CX>;
 		};
 
 		ecpricc: clock-controller@280000 {

-- 
2.54.0


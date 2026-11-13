Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558056;
	b=VF/SrGyEWqhPBhd8uSUrsoB9Yc8wALXFnHqT2UUmTJboPCFaYuxEj1OySVNwblXsaP7x
	 jgGCTQMKKDsg3ZM//sQWGkGGRXDB/0qVl4KYIxuM/OzHtg2C8/B37qUwxoVhe+W8jF8Rj
	 Czf/b8p3T8F7BpcLbDPUivFnngQVggBddKFl1AsNgJfnuUIJeudlznOj03nzAFfensrOe
	 P4jsE0qN96nqvVl/mmvr0VaxSZSMxk5WAfW8TY23MnUxCss/U9VnnD/O9mVBY2L1Mrcom
	 uAFHfOaorUBOh/U/LVStiY/RnQqbf0uomAy9Sqj/zMXznQ7fVrW7ZYVWn+5zXFhD/Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
	b=46V93mizNLRsprm4uwFZzX46sLTBM1q3KYXyg1LVzxfMG1ZjqJKUclxZn/G5TWPEay71
	 M7acvKKVU5UoCwXmMOTBmzNuqBFkQRJ5i7zI8OAvCL39pahnxx79x1TJU9pyR94M9GUfk
	 +V+Z/P22sfPZ7Y4C/8QdqXxxfc3Js748qUAZi2YU+thjo104c8xQErupv4wv+focGWLlH
	 4urrCMl0J+K/HDcja/kgyoUgTsBNPxTxeEaVkg4tk30ypadWqf/EZenOzR8yZvY3FZiQI
	 mTjWSfpoPAOFxjouJq9pGsWP2bS9PydwFixGFE1CRfUU6sKFQsGN07rAzovy2o5Btbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om3O7H6C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXf09sey;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE8606A8A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FE8606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om3O7H6C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXf09sey
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Yvh3120267
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=; b=om3O7H6CZuWD76ja
	A1swlwYI/zZhyG7HrqRsDulRYka3cmtQ2ZXVagg2lj83ncBzwXWs+gqV/znqXzg7
	SLJC7r3KKtiksbeGwf+oOxwyxKdBdaHuoFo/5zch+D+bn+Gqo5t/JJuYDP3VuS9X
	QLfpPEiENVFnxhpQ0Q506rJ4qXGMSqLzsYGDX9cO3N2/hsgXHnolt/Zuoy6nJ5o5
	OgLy0lIp58eu4kVm5os76uHwr5WOt8miJ0c1LZaoQV9pgE7W3FNZJmRAstDFFXvz
	NAKpusq0ZK+l+SsD72BI1vaKzteMOR3zWgUA+vuvMhTdwY6TcruGnsTtZDPYon1l
	RDm9+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa5pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so735576eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558053; x=1795162853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
        b=GXf09seyn/soZ6GrDt3hpUOKWnhLP0eBjvbDBBDJXEcNuHXJ/+rl2+fHRH1hfoZS/I
         Be4qf9WVtGtQCjA2Tqsnb+OPfowtT7S2aCggLhkPNsiS2eK4UbMmUVnGxbxUn+BHiy6+
         4ofujCYUp2+eejFUn1clNI0gATgLavjupRr2q1iLtEzlgirpdORBDZm8HVJtusAanMVY
         9CwRxMEjnqHFyQU93SUfOy77KLYaV7oFeNULssMO/gJCxfFoMAkHmuIAU5TGy1hedNKI
         ZhQngsynVKA08cpIKdjF2CvjbK1Gz1Ou9l40gtqhkKe58JFkZ1X/wYJ7Spng1j2qi1cR
         PsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558053; x=1795162853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
        b=VtGwUiu+rOxYjEU4C4OtwJ21BPaYGvI98hu6rWT74sCO5kSq2kUwHrjdykICIiQQr6
         7oRta/ACsFnXNJ00d2AEAVvDDstOt2P1DCaehsZ4DiF9sN88DLGfWHjOrdi+w14PNtUG
         QK1oVMb5RaA+oG3qrycVpl62nYJebdlJGA97kDlUl6uGqDsR4hPlHPDjE+f176ffxaPi
         54dgFvH7yoCQunoFaPo70ByhVa9ackvsTvLuSUuRtfEL1qnVvgeQyE6OtWy7J0p8/kPS
         cMmB6QA7OtjswChacyFgdXbAucOu0zUz08mxnhyxoU7KQvK7JL02eicBgz3bczTTXXQL
         EH1Q==
X-Gm-Message-State: APuU4Z9nF5qD0POFxI8PaAYjbyfOlI0AqYPTsBsdlG2hDHEQnVDd7dyp
	B4JaBKTFNw4esUd8AIW2D+6rE80RWviIORmzlGctZu07wd/oysV9tCmOUTYxYqsR767mrlSl5h5
	M/Ff+HA21EnnVtvKbwAOMe5AZNbZUOBjKFOnjCeOyMYcCEzNlfdrqjwM9qmtmxVnLo56F
X-Gm-Gg: AYBFou2fXfiE65BzuWlobozrC+tB4Nvy8h5cFPcjmg/Biz1AfgAzoFCcmlRcRAluSvp
	ULB1f6i5f3aBxYCtcpdCVr07WwFDvQBw0aeh6fkF9kL07+k3s4cEpkc/qh4qVdKJPsxNWvZhF67
	rr9MDN9hAQkXWYAXEZRqT4Cctv7qNvYngPRKocccxM++S3o5nQ67uB3fIilq23bNej2TR/rbwAm
	Fh6enXafegQ4sgvFJ6CxyhEyTGOkSZYIaOkuCgVZ3bzumZeDBTzpZcGdWlQeu2KdgD6xfdSNP1Q
	cDO0GJBAzCPWEfV7skFHl7QQJRwg92lGj100OxoXa05eKJXQaLmhT3Eb4T7IgqWiKBsGvlIscv+
	YzhTCL4pP5so2IsrnRmztICRHInXxWjTwlKbeCdUs05RM/43ukI6BdRrwiWdvWegSxHH34Jmt52
	B0/1dr
X-Received: by 2002:a05:693c:8859:b0:36f:5746:3369 with SMTP id 5a478bee46e88-37966e3af4emr1580026eec.24.1794558053511;
        Fri, 13 Nov 2026 00:20:53 -0800 (PST)
X-Received: by 2002:a05:693c:8859:b0:36f:5746:3369 with SMTP id 5a478bee46e88-37966e3af4emr1579993eec.24.1794558052802;
        Fri, 13 Nov 2026 00:20:52 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:52 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:23 +0530
Subject: [PATCH v2 2/2] media: qcom: camss: Add Glymur-specific resources
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
Message-Id: <20261113-glymur_camss-v2-2-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=2976;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=P53e3wtoVGWNZb9wEQutiE3SpB3zP6e/prbEVFlavbI=;
 b=KxDMjhA941/qdhUe40dCajtwLdGOAM1yru18nl5S2BYbjxfYT3is4IaHM9t3drP2bWE+hEa8R
 FkvtSfEGn2QD+9443tTHDqMw9Ik5AIAT0R9TW2SeN/efVHUEXIppLHS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6c866 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eFSy-WoeKmqNeFKM-ZoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: DWiQ0T3fxW0fZaBCq7HZ5HvASeaih01a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX+Ow3eNbd/Xms
 ztpTdzsLK2XKNZl8hLHzyllm02dTGCY+aDYN/Lzcr04sSgailVScZB8DO+imf39pE7ea7+iiJto
 EXZjRDp0dDnLbaKEnsCkLssq18O0mkqrLnfFUh7lw7WjO1lWkQEcQXk3L1FoRsd5sYUg+KwCjWv
 1L+tdY9/kQ5Rno75az8qdzDOhtnrxiVzFKcC5vLIUTVTcPT1dq9gGvpW8xPU5bGwkaeuELJ9rSu
 z+GDAcS9XdozqNk+MMIk0POrdBO1WP/Mg0Jz7H5awG49997ZDQihcWfGvQc96lS16nAwrTcNdh6
 6Iii72nix62n2JfC07jdppczIWTmcfh/Q2/bZiBwezH0aKwXXcg1AJ3apbOzSLn84u8ajlVhs4S
 RFAVwhKwHNBAyFPNWGwBeeY/3tStpa/cUeW2/nFVoUziLHP0nC0ZKVSzgFQ/O96yBaHRArCzBVy
 r8F1Swl2Qpn/n6BGiEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX6g6sm2t/3B2b
 A6oGhUhzScobzG7n1/5l0H1Cn68W58oyRS8NdrwMcPp882FImgpgRa9Het//xHnmyNNJFDI0ej2
 95i7czq4X0fTkFPT6tDtT3KX2WQ5biw=
X-Proofpoint-GUID: DWiQ0T3fxW0fZaBCq7HZ5HvASeaih01a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur has three CSI2 PHYs, while X1E80100 has four. Reusing the X1E80100
CSIPHY resources also exposes CSIPHY2, which is not present on Glymur.

Add Glymur-specific CSIPHY resources for the three available PHYs while
continuing to reuse the common X1E80100 CAMSS resources.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1


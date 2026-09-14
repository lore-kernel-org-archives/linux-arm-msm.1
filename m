Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011B466B77
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390142; cv=none; b=VK07EORWo/HUCoXuITW2Un5fhI8lLEesYr42yi3HQbBqntmqtkJiVO8WIN68+a5H5rN+ina00YAOEQlZnjv/waguMPH8DfmUa/tmQlksWSxXa/srYeKE/n/okEu8RDmOlMhnqe1gIgNSy0VlIhEqzLGe/tFj+U+/E0rmuaw8sUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390142; c=relaxed/simple;
	bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPm8l4xh/ZPmf2gP1tOhyf4KDt8cr8qqWOzNKR7apym3bxiP1iLLmV9SYZHIQHgHQzupWPFYyS5e1oOn2NaHLYSTcy0eKTnS7cJSGn5wun+AxZZ8l4TGWsnkwffWPDjXWBN0c0W5hBOb79PyyaduKROLDm+pCg6j8NX1ozC/IJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnAlHCBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Daz9FEDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnAlHCBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Daz9FEDl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6da3291519
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=; b=KnAlHCBv6duV3YEx
	r4f6PgrTCYZWkpARFFTTq3xrbA1MTtiU3Lhvsjt0v2tCaBLVo+4b/Ko/x/X5G/3T
	0YdIscReyUvzq125nf5XXEQHrlUhWznvDXw5CeCCMz54+gbFe29Hb66kDdHKuiWx
	ABK8UsUF7ut20WPa1/5cdaS47vhD1CEshkWLV/s0QS18k7JdEuxGwLSdg3yAYGt/
	jZtnf4nddwo5hhUd3145M+y1mMFrPPJqeUgCy29XmdMnrqrJk2J3CfIUSeaakeEN
	qvSRg35MI+L2hlBG9B52JMbFmPMtU1jBRDm6Ie+stwlCdzkCKgMFwQ6xOEAGxrYb
	bfp2qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8ngf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a00c70d28so326205785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390138; x=1789994938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=Daz9FEDlQ5unv4sOlD0Anp0XTtoNaYv/N/5cRrA77KFHjl7p+3LCVnxxPRqwws1Mt1
         hS21je/RDDExmN59NaOl3zFN8PO8WQZClTh/Sa+5C1zFHXCgBRlwRs086hFjxnmK3dlN
         nJ33zApwsqdpZQ8kPdEdmKTSjSBgClr94rVg1IECx6r2D620F4i5gw2HOfiGIxog7f19
         nVv5MTcjRMQsrap2D9QLm8eAaiFCIwYgx9mynDRuv2memtypytxozcA2qgHUmC79z2Ce
         I9tMx7Xmleqjx9dFywO16Y8ESgmTF/PivMdHMyboxOXK2mLQGWjfXT0zRsKOAbJS4o36
         PK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390138; x=1789994938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=LEhRAHk+owNRVQz2kNWYXizSeUZIdQIJwuHtAxcxeWXRykLLCw9UdIYTOxPqxYnK5a
         7fXXJ5D9d590gT/wy7yhbSfNzpORlkNSzlhyshdj1/myI0enPrTVeFKwjsZXbifuCNj8
         OGdYapLC63FBhRYxUHe/fOf1unPP8z6MLxcqJjVJtnaqKOp8h0hQgh61Kr3DOJ6BEe9i
         a+myGg8eRa5NyNI8EU4Fa07NRsVWM+kT2sd5BXtZp88QhIy4kYGUZm0zmVJe4qHI5Wh8
         AuSw6hRypssOva9SsqDzVvnJteB3BbWz0RI95nCPeiY8BBTE32Y+01MuleMTaj9rXvVp
         FU9g==
X-Gm-Message-State: AFuF++kHUXBleeJKhNrGvEeh2pAqsAydY03dSCRxxm489pbU3C4V737T
	Z2wobV/U8fifTIQ0LujzPOWtHRSqG+XhR4gRkjuwVpVH65/TSoGG6QNNReZajzurEKGOC4Ro0u+
	GWVWc21F0ZP5tyG45jVOONyPYdQBxIzcbiu/a4q1/9CmOJNIAxhSIXg9FPPErv0WYRJWd
X-Gm-Gg: AYBFou2BUi6cPNa7G3tbOUMeQiEK7dc/Z0LZdP6rt422dPmoijO7pr74As4NLDHb3m/
	GeGxdyn1X7XUN5xL0Ixr4kccCTIBWPf6LQ6co/VoPNEYECvXKK+2Li86+7m/MoZvFQv6mWvkonv
	nWf8ya4gGaibzkW6AuamjkSFlUl62YpU1tuJuHKafsX7DeGbd3gVb3UnhFwpH0ox1VA2NN8vR5o
	UMLwj85h8Ayfd6gvwi2A0YhIyOHwU3GjJJeIbQ0L5az+RJZaoIk38BoLobkOZndUe33smZFxfYG
	8CMXQ5n5ohLjWAGDR2ezF+s1KdlwIsUY9gFD36EyjE5ghamHMP+TJX04EBdS2IKXYowZ2jvXkAH
	YHZu+AXNb
X-Received: by 2002:a05:620a:2588:b0:939:2bbb:b266 with SMTP id af79cd13be357-93a29723f09mr307860585a.8.1789390138406;
        Mon, 14 Sep 2026 05:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2588:b0:939:2bbb:b266 with SMTP id af79cd13be357-93a29723f09mr307852785a.8.1789390137835;
        Mon, 14 Sep 2026 05:48:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:20 +0300
Subject: [PATCH v4 21/52] clk: qcom: gcc-sar2130p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-21-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zgJQHQKEKFHdly79cOiLhTxl1odoYUhTXBt
 tFVXsT26j+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4AAKCRAbX0TJAJUV
 VrKREACoL7jIuTu6kWT2irdWG8dsWQHRfjqkTuefoIhwfyFHaT9hM2hD2faorwEU3Yfai7SLUMw
 JpMl4NIjlm9k8KcX05qGU0MabGSqN5j9L8ZAP6bBAAT2DMBa905mo0Z9ABmHRqh+hZNXbMW++We
 c0EwGWZ2Xa0iEaIVqOHrd5/O9kmNZsj6mukQG11aQTFGhM59hNAfeIjknwonWueET7VMLch/fk7
 X1HhXlI6qt9tK8JReZBA8b7rIlDUzhqIV2QqzQggW2MSACn0hOiO3qwaYYyETjcpidpz1IP2p60
 D1/mIIKs/1FqHGmWsk/616xeOrbC5Q6xTsU4PRXtKGZJcHGFRhYUajaJKBlyRl9JqpCFI410pON
 vRRJo4TMxlKmedooo9wlL1JcOTRWCA6df86En98UPZ35RIVJZLslUuzt7adeHMX8oJMQmRqtJ4/
 CoRgDdEW1r1zNkSX0pB6eWocAgl8d/ERgm62VqUc4CEantRNXzU6bR3PQGaCbje5pUqE88a994J
 90N2sAVWrqPg6L2EN47JjIzErsk4tP3f+kBhWv+Rom/3MFnteU45XGp6Jc1MAZeJxCU5JqCKc3J
 KLbl7mRQQsPACG+ui321mGKWWIcZ5Z8m+DwEPhMyM90wwtAswStz9LiOHE+qBobLckrcQYdncas
 nEMrleS3Zb5G5Ag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed3b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VRkJZ5RowVm5v-UvEpDBIhPrlFhHDDO-
X-Proofpoint-ORIG-GUID: VRkJZ5RowVm5v-UvEpDBIhPrlFhHDDO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX8xpa0KQUFXda
 pbe+dHkNrA7vVvmfgpNNDOaBGFCZKII6Dvs7DrN4cVjWa+wXwFLMPDoxQpXQDxohEv4B4TcUIbp
 UUOgjAko5FyPyhMa+JuktkuyU8hMwdgZmOzM7waw4IKTZY8evlu7C0/bk1Y/q2/tCbIYpq650+j
 a9Mzo+rQ+zliIV1VOWj2KQgcM0cu/JRLRU267vUDK0vRH3stAHqltLOX0HSD65kNkN0q97PGDtl
 5zGCKynuRlV3L6bPp8dD6axrSBFNXta/OKG2qjJFjc1kbrGek7FhCIRnusw0VatmI/X9iCXX0r4
 rJP2l2KIdqoskr6j5Yf1xdZzuDgKJ9OJHwUos6sq7iUPvrw2AM2yPq1F1BXNxxN8/yPLHE+atpp
 4Fq5Z/54gPm4J3n0NbdxKlDm8g+K7pNGJOCmnwFBR/+kQgCUvHJpWCwpubZ/M1FAOsKbH7FVj96
 YTjHIl1KMW/TupMnHeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX2HfdmXLuxuyO
 nlNOXCZ1OoOd8Akg8ARkcFeADJvWTcXA8Z+IHWKWFwVBqEr6WsRbZjZfhfQvmvLDru6ezzsGynV
 Rclj7XYsn2+S75FY2w+RTMfGpSys4vE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 475e2cda3618..1a16f9d68bab 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sar2130p_resets),
 	.gdscs = gcc_sar2130p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sar2130p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sar2130p_match_table[] = {

-- 
2.54.0


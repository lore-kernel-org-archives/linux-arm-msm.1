Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2947143C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390131; cv=none; b=qzxrwzIF/cIZd6/ozZ5CJ8NI/Ig92BSU1dKfOmlHpEJQL/nd/bGbONjmOsle+gkpt/dAOYxG68VjPexoXABeF2Ig4+dpbR/s2ncd2kLGZ5672yeXWIaPcyO+yrfjBW4d2FPH4K/nbQXX5OItQMa5xwVkwS+aYazYcLGwUT8HCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390131; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G94Zwcb2OTmlPCviMb0o/AU7Pn4JI4AcB/iFlQiaUGY0kNLjlmNJLEU7zKiTOIDPYIrwL7h1YjtkheOXBZRh8LGFxEMXb+aHYpx6ZfIbImF6+eJ0l/BMcL3HM3NWcLQkdyOqKuYkjWHUCz8l8XXHJbF4qMELnZRUj3RaRqIuJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4Cn96sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M55bXo4+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4Cn96sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M55bXo4+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxpX1460635
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=k4Cn96sblhboQuy5
	cMxuQlHWpeKIrddXA5BYdoxP7EiNIy/MWbzNxaz38GpbkcmW83cNcwLFRn0fGfLE
	VMG4TJvlXqn7mWaB6naIPRXxP7s2OS3hlx8cR2uThE7pdKhzV5TpjCrzxgd+1zqP
	R+5UE1XNjiWWqGfZFN0LgTA8uh4o7EJvrtg7mgoV7SFJ8Sb/lt6qn+QJi5cGdWMr
	zPKypvz5/Rg2rHnVe0LjOwr9PWbqjDlOX5IKDUr92b2uwE1S/M7o5/4pq1z4cu+Q
	zLAOEoINSB7oCzZGgAKlNzEAwZamoIeYNvCDZNoaelTl706YkeGgs03igpFdoD/U
	uUjozw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so675370685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390125; x=1789994925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=M55bXo4+OPAw3QFHS73Pq0K6TQ36N1nfmZtiuNSz2IZNZWNJFRuSEmqADyf+knmIOZ
         rfJdvz2FbmZ3CIEPahTf1+aNuQAkC74qlEQz427IHDtynyNmOb0lEOzGAmCRfFLxMJbK
         mI3KiWBxCMpAeRSecvWXfTKClDqoFmVZDsVl3IgrlQuBBEJ51aMjui4aX8QxMSGsHUb7
         cgsY/tNGUm0RKSVteCyk2AyTtxnkEiFUPX9hJucb7YHoqD91nIJtLcHWR7+sq7leVACF
         mCvRfypF6Om7wWIJlkpsDfwGuSNe69FBYh5ooxoikkLpOV/pQifo0UulINO1UARzDNH4
         h41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390125; x=1789994925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=R/nDVRQX5AnJWBZMIpUJ0MlO9Thtl1OQP5Vwo+Ehm2vVv4F9bKlozIPL41SRtUUN3B
         AjoOxY7RhjjTOfzqWWzsbkQZHWoKdv811/QIRWiGPD5brCt+n/8sLDSOqM5cIv58sozX
         H9Xa8jY0ZZBQK4a7ozgphUSn/V/nrv+Mby0kX5D/4gnTVkSsFev2GQWBY16jZcROsvfU
         jH4Rhu6KznbiEVX/XHR5/tRMhJTNlYYaU1JUe4w2pTlzdc9/Z3HY3bIa4XSZuz2SFWOM
         EdRprOt0aSVyn04MYIGrnBVYWm4SBy5RFdZACICmzEgyXkbIfC09qoxMbiZXlH1/5wIE
         WwMQ==
X-Gm-Message-State: AFuF++ntUPc+NJjtgr5Pvmda+f03EsYLf96FZNbcvja96ycW42qUXYn4
	tLudpabGjqRnFpXDZG+8zvSjnBa66svNYC48kXtvQE/oSg5XoTgyuAuW1+ePQBvys56jHj+jri+
	BavFyzCy3whq761n0v1mFPL9IY/rOISTo4ZXlkENlBK0+HBtDwQKDreTZLA5JilqCVl3/
X-Gm-Gg: AYBFou0/toc2v2UnuHmWRRLdI1IviPuv7wP/tK48OqiCbiVpd7USUJyOVS/njV4oAXJ
	RpRlhn4CxzJfVasRG64M4XjJ4vON8xJvVbtxuVTv7cjvDaAPf0JkudkLDXGZKNsFWpwmrutHNeP
	FsoiiZnyGRfNxG40gHHM7ZZC1++u8R2I6KEJ4UdPMMwhj4ttkiJyvhpfSbXerWjvcxKHKnRBsG/
	KPtjpDs/gi+kLTiEq19fkCsYg2GsaULarTmRpFUEgQmBHEspYFxknVvd4GiofcGFsH62JXbxJSE
	ZwrtNtbSIA9NpRWAreiHp9Otn7Bb8ScckzvurEc/qtSobZcOQXbEvH6XTrQr6n+TbmXD0PFNI/B
	x3Kz9qUSc
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343041385a.35.1789390125381;
        Mon, 14 Sep 2026 05:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343032485a.35.1789390124706;
        Mon, 14 Sep 2026 05:48:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:15 +0300
Subject: [PATCH v4 16/52] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-16-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zbcD0xKA/Ju9pSsxhdtvsRJtdpsvCuXdsnp
 nC7uuOrWxuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2wAKCRAbX0TJAJUV
 Vpv/D/9X/wGaKFTwUH9gHBr7eIgfLBBvU/XMS0A0qyQRFGTYu1usAnL9hNgwgFGaZdwbH5MsOgz
 nD2vwenLgPfilxhv8UQL6ziJHLzbv1h/P9dnrzfZ6ZvQk59+mB7PJ8eFPLTf5Tuoqb5E7vzUkiI
 BlDRRwaEcRYA16eD8ZdBKMGg4hdPCL8nEqsv9f6Pr45LNOEyKvgY025lmXE4P9OePSIyVuJ1Y+L
 /cvcfbxXQZRWHCn5nsRVBF5EK+Y9chOxuajT+ilZ7vaArg7EQxFW3Ziy8DDDgg7WE52NWJNKxdN
 4va4oO4L5ZxU5MuHEvVOasJrqQgz9ZxjiiGdYCkaV6E4SdApIRSAfgCCqx2Ucx58M9vRfu+gp8J
 h+LDyhdAtPGlvQlKicjmoA+n+yFFGUMZno3K/SCS3Ed3eFn8ITbRr+JZtbLBYu3+YrddKVbDj8C
 R0WNwIIda/otgJyqIY6xz158DoMga7gZvijQtV6jj5tLSHRLqE7C/ky+O40nYATTH3qo0tnrQKz
 9UKk6/f3LeCkYQOUow807NzoqOr0q1eUVkt4ofv0qgRpgdt4vTJTOkJ3vhTeuyQjWMntyfUWFkH
 ONKLOG6eYfGh0zbib+sOFDQ6rN4vFnpiQRXXWQIixLsE+AXY2z+ruDI8HcycNJQ+RmBbxXYYeXp
 BDPNX7MqatqmoTg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX96Xl97KvIGEJ
 LsIjGwP6n+s3o36djFujhBsTeO6Vjg8ckiqity6kPdtm2gA21AINgxt5vqfKdfWEh/6LyI8hBng
 v9H959fvBqiM2ua/YtcG3/2Uwkg2iPoK+8QQt7AaLg/vqE7zNGGqWfkZDa/jILtjHZyhR3ebQgu
 E5WSwoq4siO+An08e5lhaL/YaiXHHF3hOhKENCRLNalKymRgcRz/MaEhGJQrMv5/gIdv5E2go0L
 jBz+Cu4/tJ8WmeC3pcHa9ri57M8bmjFBR0WfDQT8GbaVkSXPTwvcMSfxLdeuUK7UETJBDBLOYXg
 ULNm7o7FxafiAk+WVB2S/TEW2fNdVx24e5rfYYNnmgY3XAOWzOIubAfVok928oCsAXcu6W1kiv1
 QPIb5ZSouMNxSEN82yYCVLpDqurAI7VQNQwE/YnaBCZ6Osid8ww29yNl45d8hKRKN3lp/RQjHGJ
 Iu5WiNIHS8tVOjAhp0w==
X-Proofpoint-GUID: GJELseJh8oe6lQQzt7YX3PDHeRaKzjvj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyUm2jqwrj5Qv
 Qju3wUUJai4tQPU/NdvadanPjCJ8nTkj2ETBfr7k3W7END72mx1uuA5hDMw2MVExq+n8s0SjMaD
 ddZIpnERB3SNsud8T7+A8ew05so9zaI=
X-Proofpoint-ORIG-GUID: GJELseJh8oe6lQQzt7YX3PDHeRaKzjvj
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed2e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0


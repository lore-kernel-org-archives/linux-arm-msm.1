Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF56471CF9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250068; cv=none; b=crFO8DcNvHCui+yNPR6Z/Wsb7AXd0mY+CLjE4xPMmBp3ctEHh4r40qtsYjVucwIl3A+m1MvVRswxRhkdmnjDf2zc9Uq8cFLWcszJlKXe+gaAnf3IJyH/SxTu9qapVbWvLqK8a7hEIwLVzGtmWf73wggwscx1ydzs7DUmnhPDpoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250068; c=relaxed/simple;
	bh=LWdg1Y2c2ZcCHWC8/KLkGrZJXcAYKvr77wwzgWH/6LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fH8R2cc+MWIIolIf41518OLlM8bj+LWNJkoUC2BmIRcUeYhF+9fAWeWqQnigoL8WKuUcfp0vrUYqzkOgfrf4Z3c0bfeX2QK8u5Oq1Zbcw7/Abq2gxnX65xbhj0p/NYtBD8xt1ZK8Z5s4iaA21clkokenkrZTJ/9hrhiDSjlNNxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG68NmLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtRC8539; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG68NmLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtRC8539"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OEG2321944
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pdor0VfRQTA1y7F8qjHXpXHwVfNKROD5+egw4oRcSL4=; b=kG68NmLs9K4dgEOX
	fCGZ60AdmNgWLQRbmOtegpGR7mRL8V7PgGRZY8pXAVhofQEbUD6JnHQLAk9p5RK+
	UHyiltqjdDXMhfF2eCpXw89M1oD/QeLwjCOLkTnmio7M2h15zxgwL7tuBAdEgV0q
	NVe6zKUg5/7B/ZpOfqSRzHJOizr+njthSKiiOYGyesu3IZr2dWMj0ai8fONZPr7S
	s6IG+zSRbDAZpNMh6AFdn1nSrIEeAFkCUOm6wEBQsd9QGy6UCV0RMzgHnKBwOJMv
	Yn/3oMDBrs/cbBv346r9QAxTdX7CIyebX/KTV1wBZo3Wk7Q1sDK7S8AWPs/7IuYb
	IqIRFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939281526e1so64466685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250065; x=1788854865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pdor0VfRQTA1y7F8qjHXpXHwVfNKROD5+egw4oRcSL4=;
        b=UtRC8539wqMljPyzSXW8uBhWDPBTR8WOgihN0Er0UFq2SnP2CabBI2nuW6lIppchv9
         JW5qrHZL/hzBva/CyUCRCX6igoZkxu86q4w/7nnGZPSQf0r24L1WRNoo3+LVo4rLfKhq
         vq8r9zwo99wgb+5mJwf8BhM1X3Y6vf9FYU6y+WR8TvNnIl5nweBfo6nXEgKAjw4oSEPm
         v7F3Ahp8YNJivc058VN9HRPIx31KyrlFXeF/h/92fLHSp5xfYNekOWL8EVQj0owaxwEI
         uCdcKVEtmiHun3hMY28iYi6X9GGIcY9hmHU4R2wdtXVtcmZ6lvYfNMawm1bH+r0T1u6o
         I83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250065; x=1788854865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pdor0VfRQTA1y7F8qjHXpXHwVfNKROD5+egw4oRcSL4=;
        b=BLm4VwXdmQtS8gUxGb75JKKHZaAXMyKEa63GY3wpFmdQwE+N9MlNgE8DWGPmL0iaUw
         9dnxlVTCo9qlsiwExSXleykWyrMcT3GW6yIw2b4brp16dL68Yw0Mfhmb98eSdu/aNXP2
         ggmyChK48PQ9ibtQurt2KhWQnQ5Gq9zHgfH0zDEK+TLwAJuDfgeRS+QtmLRikNimM+f+
         Jy/p0AAPRnEhLHi1OvWgjeczp15oqh18ZkyJOqHNYMr7plxe86ETG7LdtSHhfgrvD2MZ
         CGiI1+mtJk7ghdLvBg8tMA8ppFYb/HiZrkSh0NMpnxt88nWZ+YXwyEs7T9PiqGTxp/f2
         51Gw==
X-Gm-Message-State: AFuF++mrJa/lW3WVfIw7f9gIOX7Pn4K1StIGBQtkD69nkjOtE+cqJrJD
	jF2h9C5NBVVuCDfyfkGRu7ofJYh52D7xlvslk7sVQ54nrNBTEl6I1tOrhNUjg7H2ZLhQD6dGnex
	7XzR2B8wQU3tG6VYOlbUSmMvqFtJM7+7GlS6SxOqq99eee8pNijXwspAyUX14j8WcnTBm
X-Gm-Gg: AR+sD13sbHE4/1cd1MqQG1G3JXsR3IGDtiLQeVC6AQWQEjobQhPE+v8w7IP99T/sJbf
	lxgzoAx5jB6OSviokvPUOULW8/96MWb0Rs3MfFc70EHxqP/P6DXesVqe5AiYUvStQtvn3SyDYwC
	FHfwnJmf4g7COnF50D1riHL0jKKYFvn7/A7uzIsbzTlav9V7lu3ffE312X2qCDU4TIHbV61HDZ+
	yRGQG2TUUOZWk10+dv+Kl9PiAR9woBctVLJ5RyE0uuubTwzaVzajFtUQ/5LXyoZrFTvYe9566sV
	b9e8J1hDrWZiOJJi3bdXIwLtrhXzJszHr4ulmQUZzSyXDWFlC8FO6bq9/9i1aiyo5nBN9FeDjkW
	IYC3qbZZo
X-Received: by 2002:a05:620a:f0c:b0:92e:6c8a:2a39 with SMTP id af79cd13be357-939137d105emr3416747085a.13.1788250064465;
        Tue, 01 Sep 2026 01:07:44 -0700 (PDT)
X-Received: by 2002:a05:620a:f0c:b0:92e:6c8a:2a39 with SMTP id af79cd13be357-939137d105emr3416740985a.13.1788250063760;
        Tue, 01 Sep 2026 01:07:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:03 +0300
Subject: [PATCH v2 06/16] arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-6-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LWdg1Y2c2ZcCHWC8/KLkGrZJXcAYKvr77wwzgWH/6LM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloewU1PEMBLyjKGugi0bv7W0Nt8JWLIxCOvwG
 8A8ENUlW8GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHsAAKCRAbX0TJAJUV
 VipmD/9mBCvsfGaxR6ekR7bkZu53hBc/QWc60KV1YadklV7VI/u+EsgT6S+FgEYzqDZLXSjjf2f
 yttnLoT2ZLLZMM+QCcsS4KVBcEXZyR4DsFa82Rdl9j4v/XTvYdvwHTsimaYW66qGzheIMU4IHDI
 plEjC6PqkySwjNsLwyXoAwHHXNIitvKTZhdmEiX2jjXZ2o4OA6YNtOkAHLYdI2oF/tEzKdpMdjY
 CLYMNleosp3YJkvTzjkWfvrEEean+hidPe3VW5hd2f+vboC/mhUKIO7IymR3cjmAspQ7JFfc1wI
 ImJWfa6ioRA0hYuOPpPHOvFqKO3laqev/U+OykotpbTBoN75CAXI+tk0E999RfN7WJJ6PQ7eIHZ
 gjDVBbOUtdgldEg0Sp7K0FOptgSdyC7qktF+1YwDFueaww72bvv+464KZ03Y9vsc3gxGbTChysj
 rD2s95V9Eq74IMZ5FFRZTPWeVd5CScs3iDj656Ej7oBNIBL+BykNmIdJt9KHRsYFFrz3qW6J0pw
 XDd6OJgvvNfjsRYPmntn38+s85EoIEmjXWtK/S7Wz+/qP/uSVFQ28iwwBJMmM8WT2FzhX8H/BSu
 ld2VlTnHG8MBUEGNLn3oXMWBIuTXSerWxqvP2XDfzoAO5lQknpHqtqXQmEwHn2hcyTyXK195Uk9
 fI/6jWZ10P+mj9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 7cy9DtGJd00X5tCvwGn33KNKIEUBGPML
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=W7BNYNnVXdRFd2eF4HIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7cy9DtGJd00X5tCvwGn33KNKIEUBGPML
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXw3EnzQtgoS8W
 nzITaPp//kPh8F6avxYAR/25JnYlBiNnUBBrs5Kke6FIFilQWzp42T8GWR0tN2nM6ZuvSEd1gmV
 PxYEnlBd4l0uN6ngQjavXfJmehK5DL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXxruucH0cPf0O
 B057bSIpNO55qtMPmhzmqJSvl4jdvSzjxq2j+enr4I5f9TBFbcM+hTdNAwFfm5yZSwhY9nUxEpx
 nsmTSTG0ttLJxouabcFi8TPSAFRqQy5JzrhKeZPe5qeshEH64et7ftq8KYoX/dMCxry51aXDS2f
 Tplg9r7NQnNGh7sYFf0Ho9eLiGNqWtk1dDKHBeGgxb7skgggCEWSlg48GTS7/uNUtw6hjx33xfs
 RD+9UiDPDYmbyNaHW3Ld76/r2+RhslQSvnkFaYNIXhZLLZFLkugVpel4wU096wSrRpbS6ZHfixW
 +xYkVmsxTHWFeBhe9VIzMacyhO1+5SlzJCTGliJGx3PBSnlsqplbS+EWiXQO3lg1QgVqZPNn0PY
 re5sx2x5seB+2r24cjmbxquL2RhPhNpObqGFvOr1UoRum+2b5MDiVMavLjUSOughgOYp7soEmW+
 xDHgDmFMoiMDl+QqyYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 9eb2dfd99f20..3e4ab58d2f6f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1350,6 +1350,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0


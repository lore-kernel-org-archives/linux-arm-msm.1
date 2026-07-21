Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF267367B9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640831; cv=none; b=lypGfpPkHu4x/QCV3LE/0BSEHidRWQNapcvfd5qPb8pcOohsXUj6VfKK71XtZJuKK7Z1owWg4TzkCAtEn6+PAZR7rOU8AMdRJy3iG9TSDH6fq1eN71xWIu+XjzjxwG4sab1ZVotuPtf1K8zXoo8syKAcViNH+QKnjac+VCj/OOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640831; c=relaxed/simple;
	bh=1Q+aPsoEc8W4PfEahFbzsFEdkzT9tiwxUCi1Nvr+Dts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jg+nC4RhbnD06Bz8/gw5SB8GpxMgdxyIjg68Ir7KwGvn/dfxjSUkOZ0F2a9mWUOFbz5lhVQ5uq1B9GDMpHFKE/7ZXqatbGywY3HFiE35And9rTFX7vVERZP4C76n4P9UZclUQ0/a3thZ2blXE9IV9pL/sqoWEpDW6FcuBA28cLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILqt+CBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gB5M8e/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILqt+CBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gB5M8e/P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM02L1659827
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=ILqt+CBKyy9yRzno
	zy0v4ezY9HELP3q4XYhVQiU0KhcTuuhN34G18Cjzz07DrxxDCCGGeR7ut0jgNJOr
	bAg8/yxIjzMWUIMfkmRoYQlHp2JhKrVjS2lZiN89JjfP0LUVbD6CXxo2iIp153Bk
	b/koqsSEw2ZvbViKI0S0eAxnSSeY9wdmDn8eSuonkL5DsouAk3MBQpJcK19MxEUq
	CLL0nQn7lqabsj240ePfIQqbH4xyBRH4B2XX/NuyzXuF83AcWFsxPljBsjSgvk6T
	OqA1rUCwZJdRkNCmY5Z9NnxxZqXiQDzLc2w5s4l2fx7OjB9E3JTgjtpEYQkDBX5n
	7v05hQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae84nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso165118291cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640828; x=1785245628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=gB5M8e/PmU1/MDPgbqr06idMk8cnhHOKgxf+bVlonva7KFMYnrYoscCtKt8c1ivDAL
         dgiGfnWbcfUfoyVZxWtTU1WrP2nQDbXkgm8XndvtF62BHlZVPJ8O2xO/umhcDiuQj2qt
         hIzozdIFoJDnkrqH/sE1h/sntmL0EzeC+B73JmHyK/4T2l55O9l2VvXSImHIqr34G2o9
         BrkZ/U+J++CSGR7/UVTct76Y0QOO1Ph+lduRBSNXFZwv9UJCj0kUS/+LFAv3cxYnFEgE
         3YvU5ITTRNbqj6pFpORCFWb0O6GG4fW3rR/VEqZaLB+BBdANE2bsqIVK6Yga3xvjXCvz
         hnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640828; x=1785245628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=FkEy1V0EJzOq4fuN/QPrZiODEfJL3YX8wZIAdvMXG6FLfF/pc4Q9sYEomBatAOnBcs
         I1Ar7MNZvhm+7gajicsN/Watgdmm9MiZj5gtYrcdSnipk3tB6h0IFf0pXSbnOO8ZHUEn
         kjbqv+tanhSli3Zz3Xp9cI9hIHugAmCo/n8ZJSXlYDtC8H2g4ShKIBD1zo0d+48cxqhX
         caVJMGDHFzhivO4benJ7lSKZX+j8DUBwk9zu5YJ5IyFq0N03lh/uRZmk/7E1ogvXFAvS
         yafmiM0O82TDyL3FMmklq1/l1D/3AGuuUy7iaoRcABHgUfbhGv+Dam7a6gpYwWuF84NZ
         fgVw==
X-Forwarded-Encrypted: i=1; AHgh+RqVexG+tsDEIj1BXF5obI0BZFvV3xiGFZjUA/GEntwGNlbGc4w9XWnFPiv7L+vd60DliHKlpsyVVWwB4v88@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxaE+2Og4qP0mRJK2vimCZCNlHAhUp2AhLmvXnDxXA/chyThe
	FQi7KxHMGxVqrBR/eSHzhuGpUq9E2MO++QKxiAHoxNNhRdt/9cEwvN5IfEIdOVIP20gF/kgW6Yn
	KVUGFK9q8R57rD5snHN65WskRTdulbBDAzj8r80OkUP5uYJOAlWaYX3Fbwz/jjel9mwj2
X-Gm-Gg: AfdE7cnZ8HWn1jCzousCHFo2BiqvMNP1AIz34vWZ4XxoXP6vhdOY6T1aXDcApxfVYsj
	eRS1Zo/Tp7rPiBwftbhdMD/vAeMyDHrwUWGuuvEdb07kzJH4fnrhTFiuNcZM/CYbRKSZurgl90R
	8TJLvhUaLhMoW83vGdz90L44ELgQbkuZ+nYScm1CufZ1BXguZIbmfwA/HhKw/IBCv0gptLml+tO
	bm21kNxVYuGlEekXi4/ncOMpA2riLpUyz59nfCyaL0o8/qS3xjjWTVPvFhfJ5Riz2kPrb95G6Zs
	PmMAdGsWxfa9bbYPSvDDRw+lMAaJKMJvzWbzz5XaOpnKb249KXKMmTm47krwp6BSiCcx1yHEmzB
	H+PiCuoWuLYUEShNTGgYwZap/2dGARw==
X-Received: by 2002:a05:622a:590a:b0:517:98e3:d939 with SMTP id d75a77b69052e-5213f66c433mr168567321cf.49.1784640827695;
        Tue, 21 Jul 2026 06:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:590a:b0:517:98e3:d939 with SMTP id d75a77b69052e-5213f66c433mr168566431cf.49.1784640826894;
        Tue, 21 Jul 2026 06:33:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:09 +0200
Subject: [PATCH v23 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-4-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UghmSwXVyq7m59vzKyg99glRgu3BNXPoypi
 QuoxOzsaSSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91IAAKCRAFnS7L/zaE
 w0END/9iwC64NYoCh05aYDKdo6yuya3P/ckHPS2e82lbnAvVMEoQky/EnQxtBDFPPD0x5skWCrI
 1KPqHdM/YtfO5MSQCVST0YtYoYdMDJN//zS9J+pJz2a+YceuP+Cg3xAKhM9va6B5zXaoPvBfBFo
 oypgIQWmg1vrhUlXgx9Qp1Ju8Sq/iryvv8NZba3CwsqL+U/iw/ER0zwESeiDAR4mJj12PJqAG8e
 HaDfsbo9t27mPvckcUx/k+GdRE6YwKsunBgq4UpyxhibYzZJiMPbB9QCMOqd73mYkJdSZ+TtsWu
 id9tVbMovuNEb/va9mikIxWZhr5ycBHcArZeTcDFn+1Rx3jzq8iAOR/WVsRYKFJWZnBoqV2Ag3t
 q7r78wyCUP/amC+2S3OCF+K7NEf5FZ25sVyFVnaz49AQOH26o2OeIvrfbyGu/JH2WZpoziCimxK
 8AkMFm0QypYc4z9LSheKtNxveOcTD6H6+px7AAS9qDBeyCi2l0ow/HWEyU3JPF9PwyI31Ktwas8
 QHOBB4j+DeEWhk3sIb2rW6usqoKM9yOqC8/c5xXjBJigG0JFgboRIrER1fATFg4OKhBzAFM3q+3
 ZgxkDIzGk0xNRtp2PH+Coniqn/N7G/OBvC2iMYhl9yZtj9PpsW/ckRpej8dNm8hEROaX/95Hmtf
 OM8PlqAXsoJE2og==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: PCF4rHU5y0VL9UaxhzHSaCPUzYkVgk32
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXySsRQN5uoFJg
 sI6Evr679lEFa97F/vJP7vqaCJvsi/wALixVVgAyl0RS9ZWUhVOuITn6N8F/NoItqWrDpfLNyQ2
 utqw3bb9ugJXp9OeIX4y21r3zSKKiN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX9uvsEXWOeq2u
 wsAx4GJQH4aSZuheawZziT1YgIrMbpPTpBCoKPOnaA0wF8lbbaLUo7me3ekcqmreYrPP6ptC5Lx
 IbrHid4D8knkmWi2/6XckALoKnypqPSVFcH8OPZZTdfH95IA9l2ZUrhPvSmCrHQ90FjWomuYolE
 hk+cASnsJJHe9OgANFaiCy56S801/o+YTOHGkZrXcy0AWOG9X0rbZ9kj3DVFmivdpQdU837cp2J
 u93sRrjtEmKm2Xzz33ROEXZ9YZxjo/KeaVYurpC3mN1McWI4Ct4t6UXTz0MNJkB2zTa22YujpVL
 uCJyqkNgKxxQA86Em5K4xJgUDcLfcLw/Ia6jlEcucOt81TwaZITAv5DSPjiwzTxlu9sMRN0wwHY
 T8uxMlw+WYnJazCcwTnn17MkXHQl9JUIL5xNGqlHTZhzOvJBwhTyfttlYY1Y7B12n47ytE2fU6r
 Ly9LZiHFqiNj5w1qNgw==
X-Proofpoint-GUID: PCF4rHU5y0VL9UaxhzHSaCPUzYkVgk32
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f753c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


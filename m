Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D0412BF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220552; cv=none; b=qERkd/FpuQGJIw7sTta6C7fzhCItHsccnHE3KV1np9OQmHreKF2TsAqvMgesg6kmHgRzngVUDBHQScPx78za4bGpsNOWRW2rsgttxrsM1B4N9ag5EQP59dD0HQIxP38h56tUElbE7M2EBLtcycivpLERr5PK5ziP/zxaeDlO41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220552; c=relaxed/simple;
	bh=8fjEokQWgCVswMg04BFi+Rn06J7O/YBo7nyvcTRzBCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESI7Dm4ql8uS0o2yLJARwQf1/QBJNkzAECor6UDFVo2si8cpKf048iH5ArJoA4Oyxuv+ZaqkW3l2W5glYgupA/3IvqxbUA8qCHkiUDBS1t7DrBgm6MU/fgyBvJTVu9jZU7jqMBzXW6MGpxC2TBBrdZCRNgBoiuuWNYUO3sJCFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM5BmlPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu20TXoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM5BmlPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu20TXoy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6NHaK490435
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=; b=hM5BmlPr8+EBsVwE
	joeKGDmzh5bqq9lyBHy2L8zv3TejG9gsAtrsE6cQQJej3XMU1h6zd3LWbZO0YfLi
	5QXNlcafJHN689EykP92y0nklJasfUGILHzCc1WA3cjtKpst8BQ2LzyRRanBX2in
	wlhMzjlaffq6XC5LfhfgLMxEByJZUhdqq+brYfDbpoZCOZqw6GLq5SCK4Lj0PFLu
	WBOyzliQbrXkE/9sCOdTVdDg3Gdtmys7DHn2zcIak3Z+WLrIuUuWtkuAUCoNe66M
	s6ydzYSBN0nardLmnUB+u80KLinks0ysjZQLj2lJ7MBAE/1Qm/5OYzYkK9jGX1K2
	5XepEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervmd0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so330489185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220537; x=1787825337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=;
        b=Hu20TXoybekEluN8CiW7VC2qGx/AQ/hbib8vxq/QPdncT9yzq+NUDfv7pIOTSl37vv
         fRGQssBHPSRXwkxvDfuQdEG5J56J2ltwg/ehQsE/dfjVi2/dpmvQP3X4gf/ajTfN3wwU
         HAU4iHh0i33phIp7Xk7HicBovyO3jv9uPln+qTtA6CuyimUZN5DZp1bJ88tHveNfCLSb
         Zm7ADqNkgFIgNTHAeGVZ5iSNtYThFh3dnR8E7tD38YgcsyIjuoNZNsJmtKZMorj79Odz
         w8JtqhKB8I62PSPuZy76OQBaXW/erUTKGJc3YeUFq8qXdAmI38wt8EcA6wLGSDT20QNN
         HjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220537; x=1787825337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=;
        b=gt0KAPP0U1m7R5es82IKVo2A1roxmwBS2xMzJV6mEddVFnLI1s6RFlWcAJ9FdW6qW3
         jkzi4YtoBCp0A1Sfh+YEFcQk3FVydP43sElZiuub0Sr2bDbt/Y2r2mWpx4KLDyNkS3yE
         gws+SVta06LarAba4S/y64QAf7MueB1iiY+ZqmTuReaUyveXyJt8wTfCE5C9NNJ59yz8
         sMGWfA/f3HkV/109bgdNz7uggvJ9G8+cBL4eJL4yuRX44UsPkDNj2R6pFq19ZOWC93jv
         atFreEIGadW+IR9hYJX0ds1iI0h8PzWKkdUQYmL9qU32X1yMZkTusarUXOM+IHzoiN3B
         7LiA==
X-Gm-Message-State: AOJu0YwI0HXYFIGDnmDDyK9CBn16pCh8zaARiVswz2iaGX4g0iEnnhSN
	B4zPhvuMZDKWjr2U6W6L8yOkF4+8Rx4RlHvMg7X5rDkAm5gaFjfe5blo0fV8Lw9gmWClg+ghRte
	dIlBBF3qy+aSDwZ1yNfA0VNfRjXHUB5Xd/vO7Jj+VJpSYEiGuKSopzvJ+XW+LeQumJjlf
X-Gm-Gg: AR+sD11MYV1u7oB96IVLXypYfrcH7FvdgJOGDIf63gnwL1M89yJ/DRP85DEQyMzdsj2
	qU/vNkJcngOz8TWbn7PULl+G3USmfnVtKNcOcrFKPnF2oowSMXviyaPYQF50QdTdm0wwatUj1X7
	7q8O2xjHTmj2C6k1lOr4ZEOW8gsuhQzkCvlUXVfBeYfkmdL26NMeOUJ/rfmoH9iDPnACsxxg7iz
	/DEh4lIjk9M0+ucdGwZkGfyMTDqn+h2br1AzSXzjwg1zRs+ND5GO/1v//sn3JnDtjSy3/qEm1ti
	HFfSS/ovQU38mEYyjiVRsooqCcz24XPt1z48p6XeSfmlv8npCzcrY4MO66+fFhIlov7czOqs4Vb
	zwjNtwJ0a
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr1042401585a.23.1787220537219;
        Thu, 20 Aug 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr1042396985a.23.1787220536678;
        Thu, 20 Aug 2026 03:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:11 +0300
Subject: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8fjEokQWgCVswMg04BFi+Rn06J7O/YBo7nyvcTRzBCg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH5liH+BwHRxg7Y6zgTvh82zhkEjcLL6anM9
 cNS38ULnfKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR+QAKCRAbX0TJAJUV
 VvcsD/wLaAi6hYCC6wrR7LVkwX4QPnvYtC3KrBP9bDVlne4oy18WEjnHsroJwduT14BkkGQnSsu
 5D01+4ynWa42iw/m9Sf6L6l5mSoala/2tRxJZYvfpNFIiJTjZlf9NMZBKy9k9H5Yza7bz95RHoL
 BI3FPy7bv4CXdpIng1LYG5AjObS0gVfnM/KSHKuyuGcpIHYYDj3abz9pAQuS6JHHSpIvH3DoCyb
 d01ikJ+ld6ZD4ZBNS9quKqENncM3VCevdIrmK4YONrReNA6cs3MWBPAVR+JfSuI4RpuPUrag9ay
 yFMy1ospzA+KdYqN/mPAxIms8jqZW4ZTpueR4wncgnmfOCVUevqIfcyKWxThcEQ8+djSZ/FrMcm
 wyh4iRjZCXIKIMtQ+D5tzmQX3HJy994XfrbarjAf+5oXiBARtvi6i64x1cte6ygs0Bn93umzOSC
 U3xdZ7TqG8DtvsGNK6p/c6Q+KrwUYzE2zpohjohthOScjWqvQQJ6lw7BBpJre1D2yM135RK9ve8
 SWrlSQWIzmxl1B9ByY+d+cB4cbUxmR4qBDqLOjfc1rprQQZZDrSqueH+nIAbk1qPQEY1JQ4h999
 AHHZV3Lrr9bnQCpfVMjhafI1jfb9BHjcgtsg497Q8uNwbbHqHdLK55lu8u2oV3HVw16GEPt39Ky
 Y3KPoNSPjvOikEA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: RNdiPNNq4h5KE6bfnQ3ZCslnhmjd20_K
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d23a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0NTNvPKaFbcl
 XFhy1HUmUXQ4dClTCrWdEwyWAeqMQDQXp3djkn6YWeqbAfz23a3CesumKy1ti2a6huhzYQzSnXQ
 IvsXLhUKH3J+Fec5z5dgp1DL5zsL6yHZWyKQ2kWmNCBWip5SECzHlG6yeD/27ovk7luXmFT1/Z9
 V4gQtFxe2uRr2f037XW/480JXz/MlMOA5sXdx6HQT2wl84u78Ki72vHJONSGZ7M9+nI6LhhTIAh
 1R10xZVDfxPXx2ibdfVK7urSMGAHr0gmN8UVSQdSBfMNVZCjS/3LU7AZ6GjMIG0Sy0xJAvMZHD+
 jIbI7KQiRn6ARzPnC84qmCEZflnUiBOvYY4c7aMpXlFNblJJTvjNYkdtCN2gIdU8CwW0+duH/8o
 Ebo9xFpJQNFI2TLRY0w3+X6JvQDVCNULHFpA0mYY+ws5g2m0KmPPF1t+VbasE1R9vvGSNGP+RFD
 9M/ftWGu4tuytBf4Z8w==
X-Proofpoint-ORIG-GUID: RNdiPNNq4h5KE6bfnQ3ZCslnhmjd20_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXx6ziHx47mwQz
 6AeW3GFSEHOhHa7HN2sP31+60Mh9Ppsish9MfmKjLXStCxVkjc9H7kgCiUqM1D7dXFKxdx/4zpK
 2JdwUIIGck+zsxwWf0bKFJRFWclDWTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0


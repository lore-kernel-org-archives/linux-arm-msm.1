Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73195548397
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419188; cv=none; b=fzt8Buz71W5lrCxlCqpUN0mfjHfsNvA5hGNW2+pScY5ORHYcvZHeorv+QisC0jQWIw1np7pI1rRFmdO9ios666P1w3yamMR0Rhh2eRO4+Ti7Ysc5nd89pKCTiyIKgfOdnde30zuYkj5oVEwWB6+1EpKKPzK/jHo1UzsymDCYTzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419188; c=relaxed/simple;
	bh=euGCF7vlJ7tviXbgPXD0p30PePJa4iHAiXmyIakIcTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTJgPj9SuQPox74umoxaPFyLEo6//AFad2WELXVFwokMkfuPGHe4g/H6VpG/fADZztFP/fmrskKLmYnBr24eWgR0PJjhBdIBcbo1Sj7YjTHRSjhQd+VT87z/dfMBwEwS0mQZFygqvEYiIK53NESCqmHzOGVpG4HETPsDHIHZho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOZcg2PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7z9qoqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOZcg2PT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7z9qoqk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0XSx2401798
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=; b=XOZcg2PT3oS7gzZR
	RMAI4F9SmCUkMN3kEnPkcGSoxsmIDB2YpxSzhE4bXgLsLNfFazC0iymuQ5wg6wD+
	vftxo3ZpsbzAIYGR5LlNgpx/FVTYOuFqJJJK2DGEtIpit/EwM2KYLWrTCnqKUe5N
	yrtUXdIB3gHNvEiwRj7FLExFDXd4Q96cRteWFba6LzBbjQIEPG6gpqOdlwsLaOxV
	W8QfYzNk3J20IuBFj2JHtfgO3dXwTVual3vUU7VVRhGTzulWwsTP5FF2TeHu793S
	Kp0I1Bl5kyshTyjF0C7/eiCGUkFBgTs8spplKlqBQ9y9HJcJXNRMYLQ3ICUO0ztc
	zphHoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1jfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso525629785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419184; x=1793023984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=;
        b=T7z9qoqk0UE9VkGAT5Xv1wgeKH5xXwmabrFOo8GafL5kbsPBvM0p3WHYKTphr2SKvS
         IPsoOkUssJBwVofWPi0Xxtk+hSaCFhQiRpSI7X6pCSe23QBsFD61CtJcQ272CzHI22cR
         fvviX92Br46R3UXerjSXBF902tCjhgPXcoJ5AFizhxa8kFh7aeIDoHQSySm2YqfvVOmZ
         MNosSVARMdVbDHK8xVD2xv2Zm9TTdu2udHwB1D3sresG5H3hqKbQsCAelO+pJ9PzWanp
         sas/hS2XMOnb0XmF6tDZhTvojUK6ngNuxAFr9FnDVAkXAquLYnaisSx2tPIXhRB5rgvp
         9b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419184; x=1793023984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=;
        b=0AAuERUT++NDNTsFi9VCZxR2gQUq8BzAUzlBw8oDUKnNyt+8HMF2D5DLipsK8LQH5D
         I2Qlvy+yHOxcApYS7MZkptnlhoqvXyv6KuRJ2UYAv650P8BAMHEPEHEq4ZLEzRM9DzUp
         47WRqJHIfJqCqo+5JRgDuS4JXGat7AWWSpuhHL9yCMZXCh5rDR3VCwaH8WIsOUBp0p9u
         +W0D3w7FtMGWgK99Yd+RFzSPwAijYVJV6lOd0uUciRpfRUVdEOoDHXwQQSUq3tHIJbfK
         V6yMPMFr32FOuB32nIa/2j50p+07J9oy/AgSjI6SiIZBIdUIgiRjmY6IaifOPcygu9T7
         cf+Q==
X-Gm-Message-State: AFq9FYLLoHf8p/UwlNB9hhbOlF7x8dDvrgBYrBA0cdnnuauQ0B7xn3hK
	r58d/Dg88jPWbwGTi4L5bBnw1y7qRFmo1qCPjDOcr8qPjz9Eu0UkMCjn4UyNxQr/HXQDcnAOwJD
	uLPydRtwRK1j2YDbOOe3YVNYy7BhcXNH0wxerOdzVV6elFXYAVQV/x3SfS8ZpbqAeYEFvF4EEzp
	1M
X-Gm-Gg: AYBFou3Y2qo0bnmnub/WJ4OyyVK9ke7nL2Q2s2V+XHUyUX0KmBmHCcpjYpzZl4u2IVL
	Qh3KXj3akc0FtL6/vj1R7PzovO0PtREiwAEnEL7rqOrN1CqUM+K9lxNmlMxY1uoLUPa0saDhLhi
	2lofHduCpmk83FvtK1yCG2vB2cgSL0g+/qq7pU/9wA95x7in8WJ8kBfdRVjWQQlAhZIqO5zf149
	lKQETkWQYotvVCeOWxdLJ7Emyee9UNLUNcT1sTZFR8O5+JGeOeLgD5F5sB6EHTWZXxp1PmE6yCA
	Bt8+HjmVSNV1rzma7UPkJSKOIf35MO5716g0W+M6ywS9C6j+S9nJlN4JSCiZfr+dFk6J/vGXOVF
	tfiND79IiB78xAPlGoLJwLd84MRpmUSQcxAmMbhV2P0SZHWSbIfJaRlpucvA/qIUlHHAJz82v9B
	3hYnPTBrl5krdh
X-Received: by 2002:a05:620a:2844:b0:93a:2150:ec06 with SMTP id af79cd13be357-93f29d24c2cmr1268446285a.31.1792419184319;
        Mon, 19 Oct 2026 07:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:93a:2150:ec06 with SMTP id af79cd13be357-93f29d24c2cmr1268441285a.31.1792419183806;
        Mon, 19 Oct 2026 07:13:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:42 +0300
Subject: [PATCH 4/8] interconnect: qcom: icc-rpm: skip duplicate SMD RPM
 node votes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-4-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tG9dgYZYOQhTj56HMlvwfNGgHXx2GOhjEbM+2NC57VY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVgx0KmtoJEqYGJ8E8kj0vDBKeqP014Tj5tX
 NB3obxeT9OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYAAKCRCLPIo+Aiko
 1fLDB/wLpryvznYCUI1egnVn+M3p8rYTcuKhRa7oVbJy3N4B+ZyJuJ3Fua1IRYWUTG/ByUFwqF+
 OzQ/kxi8lwqNdrcdEPbsB+rP3ivFKgSWJ4Sl09bH4VgMmrMY89iK/YHp7ck4fLX5XQoZKSErApz
 fKGQST0WtfruddqawjByE2zX6JLV2xhBNhg6fYY7bY17okIXTqj6hyOF3xm1H1kJjJMVb9UhAyc
 sD0ZcakTapTqjgq3fwEK93NrhzaOjzPlExe48W5PrsIueELUcp64cA65pBJMxaLxnUeDBax+/fN
 yZXdy0TgMdnM785yxT4ML6OxM8hx8KfemJIDZtO+qaFm57qv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX7bvObLO5MsVa
 hrQG1XZoPJJ5vC4c4aJWH4lc1lMsGqeduTZZrqtzqSOxCO/+7j4MyNgWkUE8dW7/fksSInrFWJ8
 8LSFTwsQuxd+W4pkO0FM12SdZW9ayTg=
X-Proofpoint-ORIG-GUID: VeVjorewH0yMbfRUPSRtd-zjhKFSFy-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX9AD7OCxS1Q0W
 a/q4Rgl1wdiL12/e0sSNKrslr17J+5pklVhuRHEFWsID6Wsz6umr/LALlt5SRHR+oXoQOybBw2p
 ZJjcCw1nCLxIJZqeomFA5zPvtvenTsykti09vPVFt0n4D1ahOH5bdPhAql8NfVndmyKGQoE+FIv
 kI/h1ksGcXPQVbbO5IDz8KetW46m9ICIk3KyNwh9kUPjXLHAR/wGUa42t/BKUX0zMUkjGH81CaO
 MEjgSedeWymqKTCV++Xt+ByBIYFVMQXk2ZC4+W55Lcry7BQf/z+kx01U27FSdYK96D5VvppHnvf
 Wtwx8UCYUxETgKHklBosveJXJ2J/Ya0xx42NNifXBBSH2V5AjiSwMtOpOT2NnGdsuE7NxA5NhBW
 zPqIVxYCiE9KTSed+lhVll3wPANOo1aRHw4mSv8Hfk59OFu/nJbqMYnNLEIjP2O7GiHAJ+fHufU
 ti15Xx+LArO7Z3k7VTA==
X-Proofpoint-GUID: VeVjorewH0yMbfRUPSRtd-zjhKFSFy-U
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad62571 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eZfgsOZKXB0SoYOZxj4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

icc_sync_state() can invoke the provider set callback with the same
node as both source and destination. Do not submit a second RPM
bandwidth vote for that node.

Fixes: 751f4d14cdb4 ("interconnect: icc-rpm: Set destination bandwidth as well as source bandwidth")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ddc7df31ed33..6e8e0bcf79bf 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -427,7 +427,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 	if (ret)
 		return ret;
 
-	if (dst_qn) {
+	if (dst_qn && dst != src) {
 		ret = qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg, qp->ignore_enxio);
 		if (ret)
 			return ret;

-- 
2.47.3


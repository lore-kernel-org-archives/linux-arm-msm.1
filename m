Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631682;
	b=KmCoXqdGskeqHo5kjHESu9gLeXMEZjsZ/zzU8sOLzxwhhGafhtynvFninrR2Gw/F1SyM
	 H6dkTl9uM4HIUoA3Sp4IMCrJ85oY2IGKKG1miaQArbAIvETJk8NGZG05yCrIP+kPBhIVu
	 gFk6/Ri8QGFtpo2X4aVmvTzuDYQYsByDJls25vmcdGpTX8nvKinZyK9uwcI6wryzfjl4Z
	 GoWVAZXwWmMpDI3UFuNTtgR06iLHO49SeNR+uQ79ifahnC7a9uPYguEctoQFGekupUQ/7
	 aVHKwk0XYXRKzi27FuM9g/+y+0mLBk0/Tc8OPtp5a28+VnJBZfOAzVbHbj/7P2e2Eig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
	b=yCBBKj1U63ScT7GJhFtCJvfic0yHRh8QIZFOzZ1sQV2cwr07AzvzrBKQM8+H67pFvsnT
	 +63UymGTBfz3lLeNBb/jvP1ZGefzMRvdedta3Tr0qsccccyWBTLO4pOdqG0v88yzvQmuP
	 eWl+ohZttnGZX5tXaDQxZlyKMQHf+IS2PfMfwDGKFmNB2CqawlAsgEEmlcj65cq5xV3PA
	 eHVdsJ9Q+B/zizOj55kalRur7m76Mnp1Tn8u6nZEkccsYZoO+5xMdAgtmYtcx6izkK+Ek
	 PHmxRigxTVji+YuOJFGmToITYoCbr/FvqeQ57dLdobqburnYidGeTqwsGLqs08Khkyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYYcQ4EU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M56ntrYb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC16070DA6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABC16070DA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYYcQ4EU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M56ntrYb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dpi4u3102949
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlTo
	azOp5HEw=; b=RYYcQ4EUdTxB/gqilviCGo4lwnmTO/r6IXYKIec0HqXxv0Xi9L3
	fg3yElEq+XQ3CdCe0i3irk0z6guSTj7IYvWeca7OA+dE/3KhkqDN4tncT0Y21+vk
	4FhSMVkzgXmrH85iHVHMeCno9SBJAl2YUkMD9BuNQrloTA8UzCxbcnYz7j6b4z6h
	fEPwDOMYtO3qvpoailED5xucaCUimezlWTKk0+3aQog1KdeEmW8h+Rc4fKkZKCmz
	Uy/zZn0a8m3xVrzY9TfR1NExZoxkuzFJA9ONl9vw0wS3bcbN1GbszJi8JVeZ4RA8
	SVV/Jan11UUiVnSEMN0pGcnXMrtKDDcZ/yQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjcmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:01:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so3283538e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631680; x=1794236480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
        b=M56ntrYbweqxA7/BfLmlh1kZQgaM7NF+QlCnpnM1pHB72h3VeYM1fMocaBYeNeiR39
         1k1d6VtETkei2+fnTZwTlBHJ/VUw8mTpdesImY7V/9e6M6J4McB6k0ZvKy9Nm5aj3Iyd
         LeYjwFnOBaO6rkUYjEA5fT8TvebJJ1Zh7kQjB3iHKRMwuY15tHCZ0WVp0elkBSnv3CD3
         DlWz/DXlzAZqMaP+HJa+amZYccbz2eRXk83sDCxHx0vLep2X1aTI5/gzF7Lh0NFblSTL
         dhoYhvRVB9FcGzB6DzShuRXbABRp0XKUOSuzwI83JUWuA93n/x/nXIPNqZGEUVkNBsnL
         Jawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631680; x=1794236480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
        b=WnbgflZYoohsJmXkQWwCcb+p6MHnsK1iLpKXvziBycnwIyGDiE3Ajwm19PmjImIbZB
         pd/nuyo4cVAB2ZYJuFQRvEi9KpYUtRj3DSFZ+T0mbpZeXnKEZHGNDgF2bhLgKvPj6jdd
         6ua1MfGTb/s/HbLnk9SmoeaR2g1U4UWsdZZcuwqfY42OymRn8eDaz8z40qnYFKsmWgJR
         uN8E+/Us9Dyx8iNKkNTzCZCxMdNbOXYZV2wlosN+mQJOVEpxuB/QPKcVcjd3Lek3+krT
         aqjV6PWGNqLe3NQy+iiXcOnDxflIvYXsQYHhlUPX36NxRWuvjZh5CLsVo9usWnBh7SyZ
         kgxg==
X-Forwarded-Encrypted: i=1; AKwUvBwnNxnvjmuJ1Y2cJ9n0qXR8vurEvXGZmuiSiKKhi+iwRzJ+VQmZ1QKAcj8k+ZziNf1zDNpdFxNTSQl6erO+@vger.kernel.org
X-Gm-Message-State: APuU4Z+u4/EYhyA1T2lBZ2ypxHc6laOf5u9uqqMUHLVm0hyT1Uv72CgJ
	X7r2CxE/ByAI1nItGbApU80j4mw785MJtdTe/VSiWik/OtQaUxaUTR1XjFxgVC1xsfgTGiwqX+V
	yl3Wvc8Q1VKmxI68PFxW+ERoklSikWyXy+EfgnBdX2PVCtgQqFci+5w6JZJSYAHdLOik8
X-Gm-Gg: AYBFou0vFVIDtkOfM0mDKb198CZVIWpQl/O5X1FR3IJgIZyhXmf17CvP8K+q2Ev8QG6
	9GGhCSAgsLtlJgsxCZO/k55iaBcPJSMdg2gJRFNQfFgmyTT3hh8k+uNUY0rvY/VXIf1gq6rKfty
	89QITAHVKBm1yy0Rvkxsl72dP4L15GOTg1aBUf1YDcEIprjAzEug1WlTi+Hma2Q+uZ7RUU1nzHl
	t/YlzWf0IACQpTSpls4RxL8ZDz236U+lR1qTioVAZN5+/7vysmn3bhR+KmKhYf1EQBC67AU7erJ
	4F2ra3LTN+1DfUhedWbXxo+dQfp4Ls/6dNYeu6Y/beldva7OXjWpcfCG+r7o+iOamMjpgtIVDzJ
	Iox5y1GHmrJ4J/f70fcB37lrGftK009oZXNXS1/pl5arVUA4c5KkP7LW5cimRFA==
X-Received: by 2002:a05:6122:e46c:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5ec68953084mr4605603e0c.6.1793631680001;
        Mon, 02 Nov 2026 07:01:20 -0800 (PST)
X-Received: by 2002:a05:6122:e46c:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5ec68953084mr4605215e0c.6.1793631677480;
        Mon, 02 Nov 2026 07:01:17 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm279827185e9.2.2026.11.02.07.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] firmware: qcom: pas-tee: Always initialize resource table output size
Date: Mon,  2 Nov 2026 16:01:11 +0100
Message-ID: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Rm/Oh/L9WyT5D8rfKiKyP1ZCHuU35dMVl3bZ70YesSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6KW2ngE+f+BWLvW3FLnusMQw+cBFT3BIDe8d9
 8u0rCz/LB+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiltgAKCRDBN2bmhouD
 1+y7D/9C2sfocUr5eTVqoUPCXIpyKG2rvbdLrh2vkYMCn/yS+UNOClQniwFuFdhtfc/8A7rUU+k
 kHo3hcLXFHBT5R/qDuxDwzyqFg3Y87pxMCGVIPRtzMtkx1KXg7nydNaATDz+wT9G1wJgW+FXr27
 IHXK5MP+txGYQqD6VRZfgLLXX7Vb3U1fMzu/QBXkCLaDGXnkjPymqyfrBW2v4DUpqyLCNIVsk97
 Okco7j4SeyFLX8MCRsx2LstAUP1CnFda2WTobB96I+Q0s89daP63aDBsXzAfBd51pdONMp0AEOy
 I6YA5/CgxN7cv/A0DRaVGnExxmOUELF239Jisjh/mF0nXm5EnDofoTam7sGs8ul4USaQb6kfvi5
 p3SP3H7M/hb6HJEHwTDDNp0Hdtu0IQlsoypfXNCCf7v3UWBS03WKVheUIrd53f54dcEOyuiExU8
 EtzwTLFthLjk+WComIu5YH5UalTRfXvy4hiYwbRpc2KnEbrQw6SMBOd6GFAWP3YMWLQU8jgGtLd
 7XraOe6YCiiPj7khPUkRCPegZo5JIORkvNkCPvLgUiXEhERYOZbCUC28W46Lywkk4KYCXOI3+5z
 5vo6W3TL2u6256bzNDcXyQU88R+x1QT6IudvuIz0o0PX3TNzzk6zW7C52Mqc1goca5+TP6TEVHH MYp2qikRwJxOaKQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kPUTRdt-ClNamCn0oPrVqKLH_aUJqToN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX08xBFbJuyI8/
 BmRfWcByIn7XWt5eLboLeua1xvTzaEoTACQIpQbxEWLIfuN2raMDLodwoDmfCJlsaWkwsUOP9oM
 GZhBmpGA1NpuL5vISCmSjz9hwM6VdVfcDe/KGusJIxg/7ZdimVpd/CAigt3RlO+JisNJRifU9hO
 +wYHI5/k743VOkerCQ0rOKebLZyOIsf1vWITi+JCwSdLYXhUEiMwYg+HnXJWQcsex3tz/6iPP5v
 Cll138kT3Q7WT2xNkI2eLf2gOsHL81bvyRyw3ct8W6KkaGr7ed4FvawUKaCmt8cfkwzinwb2eGd
 Pj1YyBMEkSrza0K6SCZkb1VaxUaKc63rEhWE92djUYi9BIn6Xs0xUHoTdofTKowbjrhH2Uvm+KS
 2BjzUrMpFder7QlqxHoNkvqN3InMrHoQwbXeXCjYH/c9BDclXsNp7eFrEQzLeYFEa6qIK3jOVyt
 wCIjtBuP+14QSmRZfyA==
X-Proofpoint-GUID: kPUTRdt-ClNamCn0oPrVqKLH_aUJqToN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX5cl3P8NIzyjA
 BFvi74km4NNNYAhephJ7KCQrOjNMQNWB40w+OF75HzZrZIXJ6rA584e0b/wIE8XeWX7JfxnZrGA
 jklMb3abjjuMAjGq5GfnZyDClpI98qs=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a5c1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lnzBmoKy2Z76xE5QrQcA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

qcom_pas_tee_get_rsc_table() sets the "output_rt_size" only when the first
TEE invocation reports a size smaller than the input table, or when the
second invocation returns a non-zero size.  If the TEE reports a size
bigger or equal to the input size on the first call, but then returns
size of 0 on the second call, the function returns NULL (no table) and
leaves "output_rt_size" output parameter untouched.

Caller of qcom_pas_tee_get_rsc_table() treats NULL as success, thus
uninitialized "output_rt_size" output argument could in theory lead to
out-of-bounds accesses further.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-bb15726c-4185-460a-a5f0-f779d5ee144a
Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..ba9957023ec8 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -275,6 +275,8 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
 			if (!rt_buf)
 				return ERR_PTR(-ENOMEM);
+		} else {
+			*output_rt_size = 0;
 		}
 	} else {
 		*output_rt_size = 0;
-- 
2.53.0


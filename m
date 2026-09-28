Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E62455623
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582129; cv=none; b=MqhGof+uegEm67ay6hbJisaFqFtxW8m1JxEQWpTdXScb4YuiUW4jNKtg3Ltr0zfJQ9/kJi908cZPRtzgmdhQf8gC9QLxqV4vGNq6rABcEZR7Oxip8cbuc/lO59eY8YSrHbeSSGGQJS9gWamoBzIcrGR2OqbNrmUH6LH+J5/C1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582129; c=relaxed/simple;
	bh=OwXopbR2w21pBIP5gXcOugLyUfbaGJBgXhaGWdPvL+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs1p8vxNPKi6fklYvJESvhlr5Ta4lk9BuK0DDQ9KHfZvQ/Qsqp9e29qk0/tYPWnKibBHRDNzHHCy8HZDaAK3r8Xha0n4QfnUPHiQX5UhCZ82s4auPd8E60BhbW7wyuEkH+5uHh0ukHa1oXmsgkp07mmvVAkCrVwOnN0iR/tyEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4fcd8un; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpbkGzWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4fcd8un";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpbkGzWn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7rWtD3212163
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Pws+gm99kB5WMU2axLLCeww
	zaScymdDd//vTOflTyI=; b=P4fcd8unM6dq1G2Z/BE8UYZtbtGPLiYNmgKKcomM
	nwLNxvkuTGhvXDbRqKYpKX2VoTOCr2E47C6N568DAP6t0aLpIaJh3SLIK9ZpWAIE
	nj7X6CEh/CDEfa8CzUlNjijDf4G31RYa48iM7E6xsM/BIxiiJu1g7b4StMUg69dX
	jxC7IY0DedG166fIXzAz+QtT/xHqaHM+sMrviglx2vABNcSzwZUGJaM7fByaE3S2
	frXXTA/oqn30xnOuSwcQY85rKJtlVkfTd/SRa1b8pGg7nlhn3+UmcbYIsuRSTe8+
	pvmG3xHrybGSGk0z2qWOOn8AmlcRUXOK/xc+FVvHexIHPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49dj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so521774685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582126; x=1791186926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Pws+gm99kB5WMU2axLLCewwzaScymdDd//vTOflTyI=;
        b=UpbkGzWnHuWk9P03ZZGvXOEWuiGazF3lDyJTBMqNVSHRvzwOh/6ZonOtCkM4AgcQJY
         nfMlY8ifgtTFKqWR5hwVVzmeKDsIa3TVoeB4lARMc6zuMXxICfXXrcMqVWope9qmebpP
         2WwFuuG1Pd4Tl4dGZLuqLYpA0fWgyfiy124GPLo2Vaa7YR0R/W0scI62EOOl3vUXZU7m
         HDHB089qHaQkvAlztsaj0GgOUwusHKOgvEGtb6oJHg2SXXnDNekwOs2F5dkRMm3w3x7K
         fHqEOr4MagpScRLPYyhwJZMHVijBbbT1tk3RWf0H8AYhsNZtNZlvZMWH0oJ5i/Qs+iTJ
         I9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582126; x=1791186926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Pws+gm99kB5WMU2axLLCewwzaScymdDd//vTOflTyI=;
        b=Y77DGa7QuBftm0A95XyKm6bONA5Nl45lrobpZPAmhJRvTLLVVFVlXogse+TrDPFnAn
         Vkm5r7AsmfRnr5MfAk7SPpeTb1N764X7LiHuI3cMizvMFyCMcGQPwZdJu0cTbhDvHEWW
         CS6OTLSVyxK8ej+D+S0eOCAcW67MNVQzvNUVCu6amlQ4riQaiwm70CbUV2mKWx1NSqzS
         tMpSBNeIGLkqSNBEBkWBpWr+PN7J06BSOyyAtRr+ZDPTivsZrih1D80ZJgQLbFWB5k57
         ke8mwPIoQF19OhrzKj/Qer+NTd+NQWCO2HFf59/ZiJxfehDv9oIUK3tJ65JEZHjl1EGo
         UO9A==
X-Forwarded-Encrypted: i=1; AKwUvByn24/1Mdq97v4svoz7m3qk1QaPEYmB0T1tdvcQxhSECudTuY/MKMVcvbk4MT3F4uVSQhCW9H7JltzqxsW/@vger.kernel.org
X-Gm-Message-State: AFuF++lS+bVrxCidpUS8mfrl7HLFn1/qJrJ0TD1fS4oVIdD/cAGDKBKL
	u4rDsWUDD/ghNY+ET1VbK7q6HCIJw1Z+MXU3pzzW8fn3O92H0Rt9pS5Nlf+/uWH9RcYQ306XZb4
	NaRC13ztvYdYxGLTZrUqM1xgYFOBF71jUGJewuphlQ4Ea6DPRvAJPWeyqjdhojKo4Equk
X-Gm-Gg: AYBFou1qHurPtSdne7FJgFi+vuz6nBdBKOvq2VcamYLtTqUnWpMpKAkeFOv7xwJ9Ypp
	eZNmL9TMh65cBszgkx55RNozbitC/MkGSnsqRGipMNHAXzfg1TtkBjED0/1jLAWBw0v5Y5Brxjd
	A5kpC3qjEjWr1ZruxOpVs70+eqlwB56mxRgLyJ8jmnQ9GIzKkFi4jCvfF9Qb0YAn7UsTDrcqGqp
	tqSSP2MH8w6XykuWkReOUx5qiFHe5vlGE5NMj2PQ7QJykPZsKDJXzSzNttSn27Ui8GfYpz/lQSh
	zDwFGU1rCs1EJcqOYTS2sZV+YYvS4KzgxYANKo6NY51xJR7a4tacGid9nu1a6sCVsd85CJxlAOa
	evrPlsbsdhYGTKsg=
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr1786052585a.8.1790582126183;
        Mon, 28 Sep 2026 00:55:26 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr1786050485a.8.1790582125654;
        Mon, 28 Sep 2026 00:55:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f3e68sm120089755e9.9.2026.09.28.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:55:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:55:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
Message-ID: <zxkf77hia3r6xxohrfibovncospnr6zvvrfiiznnmug5mkfsvz@2mpxuu4nstti>
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
X-Proofpoint-GUID: vHLKAIHumAV5VLcrPhwJDWmHCdHYqxWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX2w3O3BYfKMWN
 PefLcCxBaJu3f2bliuChWis+xnn7EdQTvsE4wSwCisWyacTozq5KOge1lsddFYoqiJEl1eoztYf
 t/bAjkMvBLoVHPtqgD4gvfdwxEvsXfoKeF3cErezfZ9Hmu0hqQ5SyQN+j3RI40qssIheTKPmP/d
 yIoG+ZxvdYs3SoYUerg2LlaLG7jjm+EX1RGdR53sLX9lyd+44RzWNwuwKVInPVgdKnEpAgI3qUj
 N3oI82ITgAzGbUNQz3QGUWnyk9GX9b/DVnhuU0TNuGfS2ly8kkhLfHqyQj4Y5lFTJB9COCHm/mD
 LKvnsTUumjD0536zbJY1C41VJf/FNsd7q8MSSp+nhG7mn+gYQ+Cbh+fcDiLvmwFp2KC/d0HN8Rw
 aH6Af4axObLeZDYZu2vwc/nLkv7tRZxPFoDfa8NZgdJtjKNJR+DRtvEgwQOPiE/E0P5g/ii7ziS
 RM8f0ZiHqT/5l7Vvwfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX1/+M8HqYfCNF
 sX5GJKAW+UkfQYYtNllYZ/E0bZyv5+bQxFiriL2E963rOvMhjoSyeCcmbVfmZR0sUhvXsh1hoas
 UdT40TxleWBDGeuDC5Qd3OKexlnX6r4=
X-Proofpoint-ORIG-GUID: vHLKAIHumAV5VLcrPhwJDWmHCdHYqxWJ
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba1d6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZAC9QuG5zvkjJuggSecA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

On 26-09-27 00:07:10, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

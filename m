Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D753D5C0B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570027; cv=none; b=uZyz/0kLvPspfoo2kBsdHmAaAwGB7ETD5N2o84rAG1DMB2hQnaOOB0r2W+8zaGID3YbYqFGbZb65J01Fwgz5JcHq7o3Dc10/y/LtDmCLh7EIUQH1jVbLLYrSu50THjlUOZVqn2Wz1Vu/U1NVQrTPNOmn4fHHk2FD44OcmhU6JAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570027; c=relaxed/simple;
	bh=ynPKjZ8w4+WZ2V/vR3FnT0sUlAi5K7jFsLipAqkA90U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mt+TjcF0665hqza2s+imM4tc5Enx4qRYV7bf+AnOL5Bjy3/AXTIJq3kGf5lY335yFod9vn1vnVJmYdQW3Sl3qfFyNly8oF1/qR9OMJwV+/kdTb9H9S9kcpwcjZUeyo6AubsSkTpVwE5HLqrezdLIHL1ESkuruw4Ze8IcFd0WEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx3h8ODQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJCOdySk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx3h8ODQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJCOdySk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZc8G3584727
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xuA93s/eGoElb5czpJyJROh7
	QqD7ZLX6LJIbvWy1vVI=; b=hx3h8ODQr/YcVaRIcynDUrfFmc2RYo/d2aidJoFi
	5kzsOg/I/hJSplzLXpqwl8SViv4ZYNtX0OszlWE1EOUmnC1HMHJCJ/eP7ZiuJ/0I
	qsSoMIU8Vn1w04nUIfamL/ywlW2vYfVV13DptMx76ufb77Xik5O7CL6z2nrmVCPv
	L81H5aDeSGq2AU/ptMjC4dRZpe9g4QCYaA07zytIsBpI1Ub5DU8ljME0aPWjiq5u
	2r8cXeEr8UyTx24KJ+VsKElemoSDsMQk6s+H5dwsRHubpYXDaYofXfsnSvL7zvnE
	4kQ/FJWsxQ+KDr/sYMjo+HmkNstvWbKpIh+QRyubBIQUBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t705uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:20:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1827583485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570024; x=1792174824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuA93s/eGoElb5czpJyJROh7QqD7ZLX6LJIbvWy1vVI=;
        b=hJCOdySkvtE+5YHswRTR6y7CobxWFNWMUOW8Py4uNZA9X3d9t9Ril752mzm1ZuZXGa
         TfBE+QuvlNRUSplIiUcS8H+bh19IcYQ0ahsb3BfYNG2Jt5sZRq8xs3AKl08aZuNYSgLV
         hvgBoMwa3dRUlNoKaiBT3Oy/fqN2rzj8ZKNrFrDBZxpy4dNskES1+Gp9huTVTa3wcNtv
         URXFjPMCRiCggzd93fjuasvnZ7mSJ5pF2LFZbTfB/5OJqD/e8ptbewS8XJUCY4IzH1BQ
         43DaDo/REIkzWn2mmKFp9qt8Kov+L4zz8C4HgPThQVcyhozKhMXvtgmaaQ/QqJja6klR
         Ga7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570024; x=1792174824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuA93s/eGoElb5czpJyJROh7QqD7ZLX6LJIbvWy1vVI=;
        b=Q6CdPzSc8t+mO0/T9rQ06S0BArYI1LafWdR/qMpmFlaI4tn3lknUa5iX0Jnrt+bv/G
         SdW8rkxojdjX5zgly8DboMigK6dpxz5kai5omwBkKzH/f2tszQKAzIBbKGQbnFEt2X2+
         9imDI+DVAEDY7fWrobHRe/LQH6p8FvRPvhI0UAZnPvnYU4H9FRkLQ4Nru2pJeiDcD0x3
         RL/7Cml3cjNA5dRNDNbj0l6lK9lNwnF0pU+zZErjD1BZiotvyErqQnMkd4eq2ktV00Ly
         XnuRVAIWc/faDWZYUWlyh3VpRrzNJ6mijfbpBXUtEYm1nYIFk8wXnMMYR1DgcoJMji5l
         voNg==
X-Forwarded-Encrypted: i=1; AKwUvBz+190EvADYVrtuejA5ynDYv2cdwuPZpYWrNDV7s9r5EHdFOWpudssTl/TKRqFsdG2eVIXqep7xyqjqgNq9@vger.kernel.org
X-Gm-Message-State: AFuF++k0a1amsWl8eZoW19+gXEJt5Fax8ZYHum72ka0PBeUqQ27gp32y
	A3PE66u5YRN4Z5ZKDyiKwzo9FPbzWKUxORIyazObqSZJM5rvKhcYy/PT5BNxxJ7sg1C7vaiRJOU
	pt6cUVNGV1gijr7PHxYeyiWx8JyXPtbrzGQXcV/V/FdopsxvA35Et/01HFkXUpx4tbbws
X-Gm-Gg: AYBFou0lNeNaWRnPoMfy8NWVf6Qpbd3f0Dscf7vUVp45Cim4C3NSV1/lAKfkmqwHAee
	YQ/YiaE0uwCr6pn32WJuhTb9MCvNPNq56q4KmpRHZ2/FPB49BkbtPzSrqXhbwHeAWh67JyGvSBo
	wNeyROFv/wYt+Cw223pRbf8RBufYGH65EXBLrVrMm4SSP4Y4gQs3u4agiIALljZrYRqP0OFbmcK
	r+d2fQaxsqsTqBBDCasTG7dwBUljVZudsCz1snJYLMHsKhHvo5AYECzMDMCtP2wIIqrB/cliI7g
	mANAh5FTP2h62yRdkRM+mcfm/uwAAcloVMr9RqKwJZPETwIm/1EHCddObNdIqfBM2lxNZnEdNEX
	dq9bPTQ8Puz68MCI=
X-Received: by 2002:a05:620a:40c1:b0:93e:b668:e3e2 with SMTP id af79cd13be357-93ebd0c0011mr424670885a.12.1791570023770;
        Fri, 09 Oct 2026 11:20:23 -0700 (PDT)
X-Received: by 2002:a05:620a:40c1:b0:93e:b668:e3e2 with SMTP id af79cd13be357-93ebd0c0011mr424666785a.12.1791570023140;
        Fri, 09 Oct 2026 11:20:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm5245243f8f.12.2026.10.09.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:20:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:20:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Message-ID: <bqkc6d2zazoqxmj2ryaitwaud52ngwbno2z7a6yswzdkmm6dlr@pgmb3df4aqnv>
References: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -Uw8Y5Zp3NQSzUSpkNOKK8YQ_l0iibN3
X-Authority-Analysis: v=2.4 cv=Mbr5KJ/f c=1 sm=1 tr=0 ts=6ac93068 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jrML6d70l2KIAfMEwfgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX1pnzQxt2dz47
 kQ1M0nIwSVSmMtjD9yIg6jOV3kGciPCaCD9JdgAoTQItcLuqR2C1mI42lutEc4xeGG6HRznLW5G
 x55+O+JWTe1wQ2P8xdiethum1VBL7Tc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfXwFeSR++TL28E
 DI9hP+fyrFrwFUhNh+n/P974GBvvoNC01ZbA/Lr1TQgk+08SmSsEVb9/4QHQT5vrYPA4kyyXdlR
 ikshPVM7X1Yb2fTbDVJBebUdlgNVfZQ3b/+8QvaZxUfgX2NzbeF1JgcC5m/zS8LlByRbA1F+bom
 wg+AYwVWy6ZxHNQ1I84Dv8dqDZs98k4WYnJwZaRmMF3pta73WBlqUqSfwOgr9K5U5/36HReQpFX
 cJuk9fFxLMARe1yeWRenN8OMF/9ugT3eaSgj+ziulbVxUB3+6HgxQ1i68x6DnGpLfQTz3Zk4BO6
 fTXNdhuKXCymtYpLeqaGFBz67hE+9ADYzqoCE27mq2q2cUKsmfU2hlgjOLsm7rMpUgxZQZVJ/4j
 pESCO66hS3aCX5YDOt3Ljh84voUYK5SGXaUE13od8XNOg6HdjkiVzyC1f3DKYOXJk/0wbVEBySS
 lycsVIqhT0ibuywmFFw==
X-Proofpoint-GUID: -Uw8Y5Zp3NQSzUSpkNOKK8YQ_l0iibN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090073

On 26-10-09 11:38:29, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

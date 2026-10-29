Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263923;
	b=k+HGtPiXvzaLEjt5i4i8nptsjAAKN4C5FdGpkujkkVqi1nE7ReyivAJkRQfW94Q4RyCD
	 hqY5PcuT9lfziLghN8b5bb/1HI2YcKCS0O0r27OHZjj8PaAI1Nib6RrimE4Nd52W647Yo
	 SUqKtBCZNPOCirwpgRzwxeGfrfnv37rNqTbcuruz67p0NXWmZ4PDNkR6TnXlF2JgSoMSV
	 8KxpYcPUZcvpoEgP+0npjEMnimtPQflrUsS9H8teEpZ2jA9q8keOqVSHLf1h0nBsWrnEe
	 jZx7jpbYRtbRU77FyuTltiyTq2r0wuGCV9QszDX4ILCrrcw0x1TyCmWJARAENhHlocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
	b=JEhntTcS7xMd72um9SFmDExBIuXdE6cZg7Gn575chEJEpE44BHrOFocGLw8iJqozIub+
	 ZIlZw5Ljj/gTTZ8x7NgD5NKXJcCKlZWU3rOM/h6ngoHxfLK2pTZqNaxFi2X7OO0BBluww
	 /ZIacJYAgyUSUMuc6aK7UB24dzycbbNjg0lAV6X1U1sZcF79IvMTKbiN+sLhbTOx4ZKy2
	 zHxASzz/CnghspNrt0yrLmcy6BHwQoIjGfWKJAxwLFDP/0hfZs6Va62JS5PVde9dg7Twu
	 rUppWiqisv15wyZNHuMcr5HuWDkgnPF2jVs0/9V5u62/yQtsAb39cDCyGtc7T6tEkKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60AA606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HEAK3889699
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4X4any+tpNBwR1eQM52jJjIu
	QZyhJ8gQ4zFYTx06K2Q=; b=TCPGIrKzjCSWP3h5PJlMJg5RBYB55gPdGRqJ+6rK
	JCzGa73VdvDYoNmf8/WtblZLsYUTjLU1uTpg8CT80KJAgCsGVuoG3iT1g35ZN+Au
	VcSYPBtXSRPpZp3Xf2BYsFeQNhQ66BXjAD4DDF9iJwTy65j/qKLnx6mmxd42zJzA
	L6usUXi7VLUmHRMj6HZ4J7rigQwKOORvcAT2vu2kwW+s82au8TY6yd1v4aKzeZb7
	QN23g+Du/zYQaJFMjuD84r2P20tzZjRdty8qB95hIoUif8sPtoMcsg6GLD2cIRPK
	g2B7H/48QlIhQwLSga2MElGZQicnIFNjJrBQjdb94taKGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2q5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so382451885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263921; x=1793868721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=LstxmWn+3iJSyqQtakDQ9UBEPK0rNZwr9PI4Run997dr45KdW5Jl7z5vXC0Z2vg1FX
         bRcm0CNf1/Y9nJYjYCIDOXTfuHcTB5BdzhQcGrI9XuWfPnHLQiNGvYaYYFBcmgC+TnmB
         olE/YuLnDPKOiQ9nBYbMxNg5OC9l+ZTvwKtDLMwAU0CZMLbRxKAGUwdm2CtlSXlKHTnr
         NFtlnQq4Tm+JLoMzae6OY4peHatlonJ0Sowa8ZtdKAkMuwr+QZGSqDvcCiqr1NlR0n30
         Tb9WRsBF14lc7cWD7XXOGssi2NIVdbT5etHf8bABjjT4JrgAMnvhs2LQU35ci3TguEd9
         ISTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263921; x=1793868721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=qZpVsabAunon67mvOXxLsi+eIRkiE5xZh/894hnFLloomOM6O1JGYT1jadg5uSBRqP
         UfLm1TH8uX9zSqBf6taVA7pevmnkUeEdra6/Px/6pv7oTdLUIVrIkYlw4zMo9VcVTjzl
         9eHXpiIndLBd3Zs4nCJrTNlSJ74TW5Ma7WMKcSe8ovo5zt41ceYX1xhTKh+/zlkwu8JD
         jie7rx7sNqzwR5A0KP3zfCWka8MDGusFV72gk1FggJUKBGht1yINiLHzP5CPI2THHEdZ
         3eTGvAMcVG3pi3WAkdRnMBVYH7tX5eFbhoWUclDatTertyRsLzawiCBncVCRS09r59Fy
         RXUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9zPhI+3IOCohkh1nhtuDHsI1TLxyg+R6JLCPs9j4kCxwg7bxMeaf8hbL4YCB7vdTSL8hykBwdrqTgnfDZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIqFkY83oVPoCLO5GrlwCKcPbWqCgl9OWApTi9NBLkgXuwWYtNu
	M7I1Y0yNESNudckwWTXGEiE/mBypgUzhf0m4GQNTGM3WgYKI6+QBNJVNlKDP5dZoHrzBLKtaetK
	AES6mRwnGxgz36qj79xzjcS4gKRnryxfpkF6gZ6pmObQ13AbOW9Aq9mP4/djzcha24Mej
X-Gm-Gg: AYBFou0lw73ms6Lal4MVyeP5GJ6Hq7G+ETlZ8QJO3wZb/YHCHMgbqlDEnnAWgSw+1EB
	7m+mMRDZxN6/dZ2F0XgPNQCQJs/RymneZeSii5giu/pQdMGGPNxb+QAi1nRilu2FC3KgQIUyFU8
	maKDdKJs+4rzgy7Cep+dWXunUYUU7zqXLF6JpE6bWssMVTo7Uw1WQwaB7Ovu481FFf/Yhm8qjOP
	mZcWCXUGK2eqW+W06o2opf/bufEfVfdlbVLnnlBFlWuilisrF6P+rlYldEzZt6+1XBvTmLyOdDk
	ZbUsYCF6QCh3koH+BeQbIn8CCNwGYBaWAMHsXwY/NnrZl8ZYbGbKh1XYK5drG5f2xp5itUYRlBb
	Fj7zPhiKr0zh0nlequSeoyOZgT6MY8GkujqOGjNOcWTAsWt2sIVbab2gQ+UERlgT5
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692531085a.53.1793263920652;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692527485a.53.1793263920071;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm32973063f8f.6.2026.10.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:51:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:51:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
Message-ID: <wnfymou72wbsew2krp6ub4z3j5om47fz5aexoyiqllri75rqgp@dt6g2lyrarx2>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30931 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qhMpmxXfev8wwxpK4c-ZPbyNjTofKloX
X-Proofpoint-ORIG-GUID: qhMpmxXfev8wwxpK4c-ZPbyNjTofKloX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9H0fNuU6yxET
 ibFhkiMBTvSIdlFROJLdkHG0OwpfetpmLWPyIEuwD2E4nj65Unt8AF8Xl+pqoExcljXq62/nn06
 VqbkGIZN/NFC65YWOmnv2zgwVhnNXTqomLIlL4S0iM+EkhZblkrM+p11a5NzYX+EGK+3dKB2Dya
 Pymh8AGrpwWH9D9hV+ODOiKzOV8uo7oaOjiKlKA7TkXw1knHKkNnt5swdCRYLvsDOYDh6134Bmu
 fchaYeWTHULVSIoqmSPtLhtbbRj/7Lx4uwKr/2VyejIPpLcaar34oTKC11gVjBwwpADspq6xHr0
 fUC2QqmaDrSk9TEzszgZ6rRziz8mSPGs4PsdxgiiSxOrqEki1ILwdSOMbimmpTs+GtF114vckQb
 7GDqCeoI/VmyfR2EMuVOUPvXghwgvOd7ahD3eyY9lxa5p1QYFW6dtqmN82jO8eHZ1Pc8GQ//RZ0
 Nfu+DDM+yr2whSDPqHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/xQRqEOUACz7
 AADAEMa9WX2MHgGEN2uDTRTQ+fBholqX29HxbYB3lsmaMtYHmevBqjgI/YxBTkN58MVCEEybhmQ
 B6RCSd/UXsbkCDfcJTMebv3qw9KMa4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-28 21:04:25, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the concerns from sashiko addressed, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

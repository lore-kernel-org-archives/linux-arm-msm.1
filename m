Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159A36C581
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379029; cv=none; b=AqW4nqVbXYUQcX9F0Cb1o+dq+kVUJl/NzhGUC0w4jdIZ5kSOy73kxsS3zAN5bE/hrpN+2FZOcnVI9WVV7o3tPfmih1a95R6fcxBsHzDQUp3VPUk9CXIl+flraTP2q0jt11pbrJXrZMmpKhwWBHJl7y+Mn3PV0YMgwRfDvybOdwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379029; c=relaxed/simple;
	bh=1wvYYim4BFjr9PE91ImljAZEZZAWRf8BD/w6yIwirCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNu7kz3n7A8cnPk8DyUGN22ugFxa/cfD7lOFnnBN00WVF4FnSySuTfAZKYq+V7ELD4SW7aNxJ7Kyfg2LBoLhv4bnHYKTo9A/2ll2BoFuFfEm7GbiSeXfyniyPBRA06T+sUh6dgJvJ2np2okcFngNxRn3ZnoMh4++0yG8S3Clhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmpKOp9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzWMZHt3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmpKOp9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzWMZHt3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2aOjh656687
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3NHmMxjLFkSdOoYQTyAkfV3
	Ov5wVWEEbb1JjezyfMM=; b=NmpKOp9mxQux4zBlAMSQjrzbzgfeeYgzrR4lc9so
	/hn0yPbSiVYlaJe5Ftd10rijWMi70anCMjD1Z1tt1fJbF9k2oB3J35rh+Obxw/Kc
	ncY+vgsTfM91q46PbMbOXrUxPUvQx0j+YuVMMOq01xHNhFCYotsM2elH0Xw53HNW
	/zuqMdy24omk/+APlOoYDabJpSruyM7RD6JvAaMPMrrkmlIYXCDtWt69Ua3IZPFe
	SbGiaMwdm2V+u1NRtkI+rPSldO5Iswh+LBejTEsxiqiLXHlJs9PIA/hMouWF9uPK
	ZrD9SZWbNcV03V3mKaXxUCS6iKnqcEsUuOk2imS7j2cB9A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwyqg03m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:37:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so2276253a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785379024; x=1785983824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3NHmMxjLFkSdOoYQTyAkfV3Ov5wVWEEbb1JjezyfMM=;
        b=IzWMZHt3Hi2AllYcsz5NYzMM/OqVNdwC83WI9xKs+QvQwdzP7e9ZpDRPAD8VtOrk2Q
         MNXeH77leTP/1FRytO3qag1azFFStw+VQ5ST8jIbR0GUmUzdj+6Hcp0e1YruhVCzBsOa
         QIWASJAiBYn3wp6/j25dq5ehlq9l4t92f/oxkOlaVKngRCcDonuuKd/tym1fTJ4Sipgb
         8JDm4qEWb7LqmL4tyOldTH51lsZhNQgUOymEHNZQXdMdnVbTLv5juBVzOHUyx2iXdFF7
         N704EywiymUSDAG8NXFSoJGlz64nhWDkOMdky+dIkDCzYPtQfevq926V9HBtT1ehhUBp
         Kzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379024; x=1785983824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3NHmMxjLFkSdOoYQTyAkfV3Ov5wVWEEbb1JjezyfMM=;
        b=TEckvqZ9Qj4nH/NyjhShymSHW1gVTPo45woVyhgZAub+YbqN1rVCcF/hI0wqQ2FXz4
         qDV0U4ll/QMTSueUSEUd8SpKn/372hWWtY9x6yloaZX0mmBnStScoKdu9nFmfogQ17tn
         DAY0YuEFHX9HYf+Z5OMDLMsq3QW8oXHhi8mxJH2Hf7vsJ38OamVYRfXxdnVb9PIc82qL
         eGSFCRhKLukxY9HtDhsXYEaHz79a2W2aEK68QkW8YMqhabgn1PzYIvocCQnuSD3lroUI
         qBy/RD4zWF/fjKPKXhTt4y9r3xDMC136cXYb4x1xvZO/gQ8bBxZIxlh3Qa/xKl9LQ1ol
         HBAw==
X-Forwarded-Encrypted: i=1; AHgh+RqzKIZ54LNMBgyX0FZtNN66ftQi9s367yUx2ZlwqWAwsL65AzlKia9krVAh9FlvHEf4hk72lTXTxb+grR84@vger.kernel.org
X-Gm-Message-State: AOJu0YziwIW4CrQFtIJPNL/H0XG/22enA2OwSXGEuEIS+EZlD6Nq+5qH
	cEiaL6nTGWN8sawKerVwkydB646FlAlY3JCIXd2623DXUzB8nVZ1ocyIq2FwC9hnG5G9ddQaaic
	/4lRnpJDKKZzDf6sQa5y7eu/mwuX5RaO87kmMjyycaLpEnvQCXe7PgPywHKv1+4+DFhERXrvqmx
	PPOQg=
X-Gm-Gg: AR+sD10jJ84W+AZKrb9sFZkk9eeqqCxCjYWyUUObJi6TSkLJKHWIyTX2EkntMCpT7Gx
	gJr6kHjz9ElPLWK/vNxKkldiX2k0xp3sdVERmWD0ebDJ+J38equ3y/7/rLTfY96/Q/08ekt6RVc
	kK2F61f/yTh/9LP3u8ajNozCJDiDt1jSL7VecpvCd9vPJuQpKjiRw0HJQCB2CStkEjY8f2s6Xr7
	cEwKU5lmSWGJicxMjSpztPJ5rCoXyiCFJWAwiEqQ+ezCC34hq6Ug0hl7o9ZaA0ySUi1mhc0JD1+
	6QePznURCIr+y9ILexth82AFeCG+udEVhVMtYUPj3wEGXYZYAprG4+nOypvpBgx4KKi23hW/KLC
	2+Cxg7r2QKWoEbWGCmLk8+LrjS9V7qlPA/huH3G6YNdU=
X-Received: by 2002:a05:6a21:7014:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c9008d2545mr623834637.45.1785379023637;
        Wed, 29 Jul 2026 19:37:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:7014:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c9008d2545mr623817637.45.1785379023277;
        Wed, 29 Jul 2026 19:37:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm16691889eec.14.2026.07.29.19.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:37:02 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:36:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
Message-ID: <amq4yNrdA4Oe1IOS@QCOM-aGQu4IUr3Y>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
X-Proofpoint-GUID: D3uiBMS12RAawda4sRWLQU4ZsNkRSEyf
X-Proofpoint-ORIG-GUID: D3uiBMS12RAawda4sRWLQU4ZsNkRSEyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX33nrx/qAaSA1
 pY46Cmrh+oIYoWfsFPaWyZrej3hCl/OSZCe2FBqoto959LOw4vxq7VZTsA/CLL0JaIAvIxyo4M5
 ITwTwLzezNgVPSDlal9ukXHQvBMiFSIuVNBKxchYqBBYQKZCRo7BVRscDTxm9SH8PesMV2P0KMy
 AMj9u2uH2Nx2cHs3XY1e9S3I3cOSmsCgLNNylSQIJwiZd4o35we9Jm3Qg2Wcq++5HGw51D4JxDw
 J7ZDTOoY3tmoVzFNaK7AxqP7QyEQtXfnoE1UGX0KeNK0eXJLzVn7s4nFpdKx82aD2HH9LADebxM
 IRH6FT0QYCgQVJySO0eZs8p+f4CVpDJ1VGyvNX97uxV8kjxelVe+XuCqzS37ycKpvTLWQWb7U1r
 CiIcQxC0r6YxMbbJGBf4Qo/gDLGOZ5yUrHcw6T9QSxwUt0bJJW+h0JzRNKVBeA/2lPX48KkpSdc
 AEXGtXtJ2Mj6+rIGllw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX1IZkXWW75WFG
 f7UCYFpHaMvrSiKg4mC9L23slokEAmROsjHohFuu2QWXwCS7ljdJ7t+GuSmWIBDSgBTNhr034g5
 7UHUUrK2ciakqK19MUDg7amku+d6zp0=
X-Authority-Analysis: v=2.4 cv=OP0XGyaB c=1 sm=1 tr=0 ts=6a6ab8d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-NgSUSuva62yS0YON0wA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300014

On Thu, Jul 16, 2026 at 04:29:11PM +0530, Taniya Das wrote:
> The PCIe and USB3 pipe clocks on Nord are sourced from their
> respective PHYs. The halt bit for these branches does not toggle
> reliably when the PHY is powered down or not yet brought up, so
> polling for it with BRANCH_HALT_VOTED can spuriously time out.
> 
> Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
> convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
> clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

For USB3,

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

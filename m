Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACD50AC2F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570082; cv=none; b=TxY6Dl4grGbqtUgjL4UafwvN3kxcAQbNzycAfmPIclTtWXLefaA2ebqDEgzKafk0ib3FdlXQzmZWVfBt1Nt44g9w+KTpwyVZB4SjTeeBtMHy1xFPoxTIJNqU2w+qy2bxPT28UspWflw6szZx+MWQ/36fiXu9cVjGxct2E5f+Z18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570082; c=relaxed/simple;
	bh=QG/xfKAg3z8PmN9x8CvACM8+/Ordyxc/n7oiA43oTrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZgzn8p9TNYNqLYAbL2tWwAIV+Dn0gqPtJ+Fc0pSveSWw6oi79dvgybNaqvd/KqcddnjPSfOyVqWkUOJcCvHCcjlGhlC30qfGtLP2KZXrlfRpyDAKNaq8E9cLY1t8hIkzBvTBBllohzkxckk3IWUJJgn4VHqpEOaxlvBW10gWo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1HW3RSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ2HHLRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1HW3RSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ2HHLRT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZdiY1879670
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+W0zAIuAAPdlKzcr9M8PXjcn
	x9tgfmOxwCMvNLyqNQ0=; b=c1HW3RSGsu7x05u0+h05lOhk6Sss72g2ikLekh6l
	XoPO/t1I8i1DQAkHh76kA270x1q4+PdSeNnt2h7Iko0l29d/14hEzbfPUwTZpuLy
	uJj1AhLhQrQONHfQMvCfCqipW898p/N9kUvKFPP/bgd12K6WmxYQehVzplfuQPyn
	cg8VBRjvL8ZECQmsiV9/yT7PXZ8W8j1WbiEI9bgYgduon8XTogX5kJEqCXCbpH8Z
	bBUsfv8KYzwsahJAZzIK4ZyArtWEzWoYiFw3Q8lbQJHViJDr3kEe0y1IDygG3M1O
	85LRjaMp6VZzflyEe4K1brHGEpPXKHmiONkOE+4rknjZ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8g62a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:21:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so1234392085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570079; x=1792174879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=NQ2HHLRTF8+az5hUtlQ1i0vMsqrX8bay1dqv7VHwT+KQJqhEvoGbQ2DIpuB7VWc3hh
         U2CW5TiJRemT4dUxn2fKsUiDkDPNipbJ6Hz7mtsLSVtuB2xPUsX7NGi3AqZuMjRLWZsq
         OA8swLUjvaDUcL8k6nKzhzBtVYoNOpo+6a1eyk653KP+po7vyscgJgf/IJzvJEaFnlJY
         kgpe7XYfMroEaYeTMZfDGbhCdzBOv5ltt0qKrBzsXYcLQgavAZN3V48kqZZmC1plvSHe
         Kb4eAp5Chs7f1slUg9aC0auXAkQG+KjRdX5RTdeHFwpeyIpQ2aE2lVBVrbn+OJNVfrha
         2NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570079; x=1792174879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=ynXgoIqRfaE0MZpe1bepIzAatYmGiOss38HUoKVBhPh05gJ6savAOC/ZhY/qZmkkzL
         nyEGtSzhws2fqkUQWq27VLDnhG8rBC/Bs8H0Ug8JS6bttxxdv4K4viiKmoM383FO2+5u
         LN/wtZSJhIR51Qm2QRvAwU12dlQQzdGLhQD3DbKjreSPMapHjrltyU9P1jRzjfl/lqLh
         49iTjKkREUQk3jq/eNd2r/k3FHlk0cKIMK5bdFNN8hjuhBMv36ew8GMMbrJkacUKE8Fj
         bIS/QVZ3DTuWFTZayvEIA+xkykS3UUjy6K8mXUC+d0hIFo6qyZgwA8r6QAtYdkelNqNy
         rTAg==
X-Forwarded-Encrypted: i=1; AKwUvBx8wkkMrUdX2HvoE/Ywhat+BO1NErWIYAZXa9MEUhfD19R+ZQh6PrZ3ViPSr+nxng/NUibIqIe3YO/aDTZQ@vger.kernel.org
X-Gm-Message-State: AFuF++lqbwVQbPu30qMtuHuMI2O1N/JjkFjtL/dU/lL5ulVL10353Ybr
	7cB3DIwijGQYmIvsbVKD4y4NvGKfpRN9x7Ivojf+Gxf0gRafYafrKcedzb2WMri+XNwTndLt7TA
	IVkgUjmN7SB+c/5a6je7n4taACOZTVam2UI1s8M0H0c2m2wTadLDE5ZyZOqO0WDTOQcGy
X-Gm-Gg: AYBFou13iCbKI++4vDooORgyyme2z0DCAcHkMDJerDT3asiMeuoEXr2KCgZNTeMdoQX
	mEWieThP6t9qzC1UctaqAC2L3OudcfjFZrkOGIQzI4HkwDWuUTaMYg62t+N1cBBn9EsZfEbq6hB
	e7KqLqkqiQaU0QVr4yDHXlD98UIlDceDACnoOsv73YezVBk7HOjWbDDOamegCVPOs41GroFxQNx
	nfqDYPT29mUri/PDAktanu/kZmHMQs/02wfmIGa95xwnoUlHnqP2+aTPHpExXZJz9aVSgQNYK3I
	nxIU0W6uPvVFsfdVLHJ0scCNNEFwRSzIht3qDnCfuaz6nCtJrMnvVH5QdoS8UopgWsqbV2sDCD3
	UKv+0WjpiXmgztgQ=
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315313785a.70.1791570078588;
        Fri, 09 Oct 2026 11:21:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315308185a.70.1791570077935;
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm5307067f8f.6.2026.10.09.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:21:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <urlsho4oj4uxzrkqgsaimw44v52zcr7h4oocpju4gwgkcqtapc@zk4smuejtnsa>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-GUID: aQw1WmefsLVY6lFNR6J0yRb081I8LsdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX1KTl8fljCSD5
 +lldiXZXxPDWsw9bAtji4Zg/fL+UF7UzR+sSzTdrSSdEOeQCQ/KQeM+t9pPHN0CDPzVmjqFiA5T
 y39akvNmbcRBHXXDy+pelU60gqwyk4UX3q7UDhqz8R8x3DN1tqQQnS0M5lirIeIbK0eZolL2aS4
 9q+7CEBWxKuPvGyCcZIEvtBaqQu4be2QhgNH+Tr3uCnqxj5ocUSV4JtatIoLaSQdzpaMfiU3hqC
 P4HsjeFkE3Dw20Tkm88kRcZ+5m+U8In/I2A2+qNDiR5VbrSFQS2Sbic7zUGzobSXymY+QO6YE0Z
 FdxD9bR0KhSTzJsgSvOTZlKFFygAm4RwtF4oUXW7vfpYR5fMqkHQI2954n88yAAEtknJTeOToUS
 Zuo5z1A2JWb6f5NTO8VZgSFt7EPaVmCtJ5i9YKOZmczNhb9suteX1Hs+NYFylDCcSf0d7oJ0F/p
 RfdvJiQNKlvWpAl7SpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX5Javvchk/8xw
 TWCovJFozsOxsHCkXKxOQgCqk97aXvcfkguTxdytO8tKA6esRkGEBLpD2LwIOqa+EE7JL9mYMOQ
 PJa2ix0z0Ls0sPEHi6cKpSRRY4Bdc6I=
X-Proofpoint-ORIG-GUID: aQw1WmefsLVY6lFNR6J0yRb081I8LsdH
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac9309f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jEBpRxE4x8LBKc-QtTsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090073

On 26-10-08 18:49:18, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

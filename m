Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D154CF56
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653331; cv=none; b=SXEAkH7EpBoGkL3Q1PLqelFIcBkq1tXpnWFALlHygki3RCtgSaWU41615jvsiOcKjH1rfkuc50AwPGNCdxKOxxwWqw0gy+QlaqErz9BG57bSXCg/AZEWu/AWw03UPjGEzdS6Uns6TuIH71Xlxypr207n3d4nMk+FJv3AU4iPf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653331; c=relaxed/simple;
	bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AokV5VcoZHAqkq7vTZDkUtDG51TsFL9aFhwyRZ+lEyS4Lla0Dc3mEc2B3GBjRCFc+OR9r4Tc/3n5t9p/zDh0O6I9iHIzHyIlsiihiaD5LAvNKOk+fXEwOaLt0Cn317eM4DKbHNl7KUiPtr24G+dc3fO2WBIbM1ly3h9unPwd+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8ac57Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Reb+1Udo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8ac57Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Reb+1Udo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjxkj1954822
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=; b=d8ac57JvkjcF54Yd
	2ivhXqRcpnFbhX/acgkvMWhvab8FzZfMcpDcKeGH6k0YLhncwk+vZsmwnFDHycXj
	au12eclPKbBlHYpBxbgPhimHzv22QE89X3FSHRWZwg29Ol1mnmTqIRrtGLazTr9V
	pD9TbiESQp9HkhK/qdZ27cAqKJaVpdrhOHhkLun4HSECE01vjLiHJXz+GwazZ7Cq
	nihkHh5fXeEzArc9LrN4FOO59fyC5w4UM4S3ImpMh/X7aThfMLtiJpu6NvlpqYbF
	0fARxvfK61d1+NTR1Jtck9erM3CyL7vN4mBZ5fL6ewn7YMHPsb7pxw0KeHoAMex2
	M17KWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5g6sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:55:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1255238a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789653313; x=1790258113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=Reb+1UdoIuYU125ckbNUgp3P8VH2ZvCGt4faxZ5dirr2miYByueP2GGmgml4OuZvNg
         JQX8LmIxVrAwJ+1LFURLTJsX5oYrqhzMK+MyRN3auxLAipQJ6v7qPfeU8VxnsxtcC/mq
         c6ou1bl/pLJr4fhG3/+F54psZyXGpr0vkIN5HvR4p1qCm69I7d05vp+BikSaOcDYuwV8
         PyVqeDi7KOvFgcDkXKMiuxyh66gzVAFL7ky59E8uZ714IJ1P8i+ZiQO8jOtmL5+nb1h9
         S7yNmGrZzygFMp9sTp5o8rn9FoUqbDqWOWKXzGxNkFK9fY+AHh9k1c783BTdTrBB8DNN
         Rj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653313; x=1790258113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=XxOruhvrNebYiq6/zqJpzXOu5lrk1hGceXgIxul6doC4Ck9U7FW37vSlMP+c0G+9kD
         iBxcgQXyr53H8iLjoEVEcIwjmJN4EySdCG0WZhjAbgXJopp3tV2qCX0AYqxMP6plk8Ev
         2SEwzsaaiLU02IIeBzqK/wRKbajk02SAeQ7rKtrNWrrYGd3LQHryaOhl2nEaVMC1CdrJ
         tDU7PWzu15krg1qF194W0Lw/dgPT55L3prz3L/v6+6ARtSStjw5n2eB6FxzElquYl8Cf
         Yfl9GsZM258WAagKJYiMO1+zQiuV47mvibI0sdfYndhJCPLLECIRyB2D1NDIsU2UR1kB
         SWlw==
X-Gm-Message-State: AFuF++nUS1dgWELx4LurG/znKXyXm+kNY+600k/i6Xwhar5ErFXA1C6L
	ZXeU/6iSGUp4UiFJy4GCzHTX8TBlQwC991/ywgvGXcBI1yHhYsGGgyofw/B1DNlKFUpNIONbkt4
	8iTJlsGtXKkRjTyHs2t7j7CmXELUlNSKa21S5mPPzL6+aUv+ln7w+sj1ZnwvJ6b3/Gsl8
X-Gm-Gg: AYBFou0m3RdbtQtDC+lUqgjGUAxkUdQF6lwuY7osDzzyNNYCnndG8lanDqk2Tur/pSv
	sxb1qnT6mxTX9ybs+BjKkYo6/AQe++5ypJMvV5iMutxCRo7L5Vel1t3b4ytC6vtnHipG8wRtPiB
	umI4ZZf3MkybwKtjAQ1CezIfREYa7KAcENqSrJkStgqFBLOpKMrQ0ebAqKlNA8QlX7C7Mpp/lg6
	s4cM0+uBeYC93ZR96aVRIUib2IbWi/63y2PufbitVd41dpRcWiV/4G1xbYclvixr+9qXL5uyzjZ
	xsKmFv7yjuUQclhfNiBPMiHXwDAHGbjwJdrbwJhmDBe7kOwMbC6fyPE9cKWSJEOZfJ/9WGeE36t
	/saJJpKXTM7QoXB5DsA==
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561365a91.20.1789653313098;
        Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561269a91.20.1789653312596;
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm14083961c88.15.2026.09.17.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Thu, 17 Sep 2026 19:25:09 +0530
Message-Id: <20260917135509.2760476-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
References: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com> <20260831-heartbeat-v7-next-20260828-v7-2-e3ffeac46a51@oss.qualcomm.com> <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfXz4PACfpLW+k8
 Sy9fQjQmWrjakgdr91PN6CGNMOw4S1804NSfmZs1T7N6wdpfGklGCJ63cQLS6kbaye/Sepynvks
 eL6rJcKHOc4MqX36xlCM0n92BuHbsKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfX832QPfBjrIwZ
 4IDC4upei89tbOWesqZ/jGPH0W0E1QVNMYcxpa0YHLwRg5yuTurRbgTOMH/t46tjdwInrgDDRQ6
 dgKbTKdBa5SI44d2Tih0M9PgOu/C7y24zHQXNTZn5ybXt6kwHOVDeh59ECjkpDAqEvkFoAzzaOH
 KxbMblYjJmaJMVphAOYiU3qTgOHQOieBb328gnZ812qdaRRbDoAfnPxxpTi6kJED8jHqGE6AjtF
 1fEjJCiXoy9ipeGMl3puY9yxlpfLAWTFdGxO8dCE93xs3kRxPXF5OJ9cY1a1A1mf3ZuwthuKHDT
 pog11D6rlNl31YGKLyBE8h1AQucNam8wlMfis56izvnNSnFiiZTaya9jkmoZU4KSGg9E54SuxxA
 JVetMo2WNrAOkm7oGKjSDGuwlAljBJqHhWkBjcqPp/EuJjBu/VZbjBKcAPwu+KJxIX6mw3vkRm9
 4pXGhi0D6VvQL0ITETQ==
X-Proofpoint-GUID: EiNIyz9uJscyFInJpJB4l_1imDGjmoz5
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aabf141 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=1oU9jGvioK67i4IjZRMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EiNIyz9uJscyFInJpJB4l_1imDGjmoz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170196

On Tue, Sep 08, 2026 at 09:29:27PM +0100, Srinivas Kandagatla wrote:
> Does these two registers need to be written on every prepare?
>
> if we need to program just once then we can just use clk_regmap_gate_ops
> which will implement pretty much the same driver.

They only need to be programmed once. I will move the counter and delay
programming to probe and use the qcom simple regmap gate ops for the
enable bit in the next revision.

> This check will never fail as the device gets only probed if compatible
> matches.

Ack, I will drop the unnecessary NULL check.

Thanks,
Sarath

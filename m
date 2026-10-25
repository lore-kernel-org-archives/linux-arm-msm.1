Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932815;
	b=eLNzbFKCGzn8CJFN0yvp5XaGBwZ5UtgiTk3TuYadvcF8Ii4yWp1To5ga/4OC4g7+0cqY
	 ozwlg5trcJco2MkZtGotWqYSKabnaj6kFi6CgRo7v/cEw6kifXPsjZDRIsRNZp7djHU0B
	 4xbMfsSIJ+mDFEZMT7dJ6DTnHpudoWve/NXzPC2MhVMdMctZ1Bxty11LyZa04mL0Qr2tX
	 einypcK9RZNG00MwISGaWGkK2fBjVBnmHyK3wHDD5B/uSUHVezIbsm9c3zbjhz3Sr3jRt
	 SBkYCfIiNAPc7Qg+3bS/r4DYN77kkGDnbEMHcvb9rfPn2ucEio9Ecm7HdNy6ay6DasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
	b=JyX8QVtEfUkkbPtGPr8+sLZz5usCR1OiNTEwRbfTKTxqC4bVC3iW1x7CAnfZos9UPEcp
	 hQ0mEUHXcEy7Xn+ySjrszvfAt9tvQa9Vu/61ZbgOj+s4zU3gkGaTPym377rVfaUlCvcwa
	 IRZjEpnGz+Wf/rzYdvFgiSRXVwr/wcBiofEnaVwmi9I5o6m37iVCKAOAzWkhD/p5q26qN
	 3ppXIp4IVtn2fXPuVALAxX9eF8QE7U1cfxgsmobBWj6PsygRBEYwcDOmVgmERgrFH7k82
	 h7Gi9hBgDZHNzinfzg/2NOWxUpT38JCd2+t2khwYpxzPaJlKVKRM1A5gOZf9u3otXiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SZO6XcMp;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE127606A329
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 12:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE127606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SZO6XcMp
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so16237185e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932813; x=1793537613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
        b=SZO6XcMpqObUDsLkUHMn05TO0jS40Ri2meMLtsJWCpB3xI7Mt+dtUpPDu9fak0Rtd1
         PwpyEl5R9oFUDplBtyKAkI0Lf0zTgiDeJ5SvlKU7nf46epwoCigpNKKxTnKT7tR0tsD3
         QVBHkfoq6TnBTFvmdhgjn25A05g4MkTxB8W0nu/AiOuBuD/TE7+5G96Z8XSw3pbnzp/a
         7hsL/exfg+ZB1pyyFXNcx5Ug8GKbUcfsdWbz8JyHUAcHoxR9Yl6X0CZneQ3BdWQMtDxH
         TlQzqpVTRrVeEvSdwOmV4SOG0wg7nvVyqnlKAIOX4g10+Vw0h2IGiun8tS2q1A7Whib6
         GaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932813; x=1793537613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
        b=Oy1QQvIsipdXjHckOtFL0jLhXWGNJiZ8zZC0vMLPohSXXyT3la5tX5sQxmrHtIZJjw
         /l+VOh0dyxInIwvmHGqpZK82Uu9z1uUJ1sRMh9MkPV6BGznj5runotdSu6BPcZCnuHi8
         8PzN1k0rt/kwV/54o2h6QVHPZ0ZS4U0MBK1BoMzlAqhi+JtfXn3UAgiP/7EMEBsQso/g
         j3r87ZUMh8a8elZTDGOEFT4TXthEsrG9Vcpq68tshldu7VSqmaUQk7kaFojaB1QUykxx
         zjiulIrPPxlik95VQSk347qMolSOZb1oDC/VqNDmuDg55jPlFiA7fJi7zKhg0SHRqauY
         5mNA==
X-Forwarded-Encrypted: i=1; AKwUvBwVM/LnLOYZJfT4gZibTV4yJxTobkG5bwPraLyfsUmA/kiodHfzA5zEkmnqJ+3Bndo6MjBnSnIEYQ3W6ScH@vger.kernel.org
X-Gm-Message-State: AFq9FYJO8CCNSdtuFFJ0E2rge1W42BeII+s8RSCR4c6+Xqj5y0je7rAT
	c0wMPyMrpyXAjRenUJj1oakcb7hG9RRiIesZeIggqxbc8qBO1j8sEv2C
X-Gm-Gg: AYBFou0L2P8ftMdP7hMh2pQM0FwlrLYE1JhHsmfGXnQTe8l+sCz8JSDDztx08x7oQI3
	2H+4Abn1ztLPRqd4FckBD08rR8oYOmyyuK7E6A1XnZyfOWhpH21J4zHOETho9qZLhJt6DG70aVh
	zo2gduKuwxHybebhIv9jTEUvNyzDFYNzhrNMW/WaYU+gqlnIgicGZRrg/Dei4oNHbdHmgtLSFbd
	jh5wu4SeuzGuIDOq/tJf9Mrx+bkMj75CrWu2F0KWXdoAS7W5GF0vUeLJiQvSg5KiXxyPW6/Fh9S
	3b4bHaLFhGO/WJUuBsFDgrilSf+s9PvofvmfclfqVJYDMBXtNQvmeZAsN4HsXUZmzf6Umc9cORk
	hLjoo2zGOnskiLoEoI3+Q65RMWHVt/R3ftOk5Ic6qpKOlbjtTSWudj9Cu7LeJWo2VlQu5sKUT84
	zhswLnf7oip5pqI7bQthPynefeFwcTtsl6MlCov5eaLzqxYFMT7kHEmzYchkrHPEC/wNs17M/Pq
	Kia+OXL7PE0uDXk79QBaShvWwRlDhMtMs6srgYjLw9NooI5RLTxwM/hbFAr2if+8siDPw1/So/p
	1150Lf0ta1g+h7Gu5RPpm+0APeLnInWhzegZPhROaoJA/IexFszrCsZQFuoeAeZqH1ww
X-Received: by 2002:a05:600c:6749:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a35ad01261mr66247355e9.2.1792932813213;
        Sun, 25 Oct 2026 05:53:33 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm128182175e9.6.2026.10.25.05.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:32 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across system suspend
Date: Sun, 25 Oct 2026 12:53:31 +0000
Message-ID: <20261025125331.208366-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
References: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 7:56 AM, Konrad Dybcio wrote:
> No, this is conclusive enough that we can drop this patch.

Agreed, please consider it withdrawn. I have dropped it from my tree as
well. Thanks for looking at it.

Ramón

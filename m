Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F747FAF5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804809; cv=none; b=d/tOjlU3/xxfzSRy/V9Tl78ybNgZgwtuSCRDuO+xSeaSeGWJTIe4kLrBfR8fJf4s7PHqdQY32QhjfetlSi5z49NKoNyowB7jpxvXBH/sWywQ6qMQyJzoH7rTpiJjUPvfUnVb9iyTURQgt8mvQyp+8f6Mf28xTgD+LIyn/76TAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804809; c=relaxed/simple;
	bh=qE1cFGUPU2WBN+CugW9PSSVbaWhX+WvGyXn9/fVdNR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIt5G21rUaJ90lgsI6tE5edK7fM1BUnMfNzDIHcy2NV/44L5Yiqm9cUkwgLsxOEjz+1vyrdJ1oNjYXzzkU7kq51vEtIpEIvcEXyNkWYTLKVs2Lz+wAGj2FLGXmAGKrCfcSpXpk3dctzK5+m3zdnFC7Fyxs1NrOiXvjrE80f+wsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRW8KoQg; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRW8KoQg"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cd1012479so50702026d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788804806; x=1789409606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qE1cFGUPU2WBN+CugW9PSSVbaWhX+WvGyXn9/fVdNR0=;
        b=fRW8KoQgELF4NmmL2Q7T3E+GQMmdqLsN0rvhDh+aH4rz1qfcvcBVOb7hQ3rqCf6/Jw
         xRN5JDBQ4STP8J5msvbliJ3n0hD2M52iy9WLK0TU9UrVIREt+j3+QprXqwrywBrH7aHI
         PShGo2gDGWt+XHitqqcn7Cn91xWP9L0eHzKtQSkuhcelRX7ssUlrYDmIyxyeB3357TOW
         xj8IzB6Ks5e1BtbIMMxRZTpBdlFhS2psfv8MbGR0yNOQjnOKB6ydZJBk0Bp2Pg3CXtKP
         TIQu+6p74Q0iW1sVour2yBdgf8MAH9IPr4qDbP4FRXTVO9GMOuTkm83+5/SC6jUYV/3J
         Ap7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804806; x=1789409606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qE1cFGUPU2WBN+CugW9PSSVbaWhX+WvGyXn9/fVdNR0=;
        b=QVsVhdGuZS91AfoGim3/1E2d7zk6tnRwTl5uufS/3SxqhrBuOTm61TPr/aQhKd2pPw
         UTV8kbIwn1HBDIno8gOWmHnqKlCYIkLqZzsiYre/EHiINMD74kmBBDkzCRVqEBdVB7tO
         0gm9FLKuQI+ohp3TDrNcBuoLgO3Fa42HuCw9n+5p4NNbznPV4tzRnwlNSY287Y+nYBFM
         w97iez00x0rt6NEEL+pTAAo9AH4ePSznis7Y1krSwY/wYCfi4mh2P0zC1ILNJQXWfWv9
         yNHDP4pv5a7B+3Y79AseYKBEjGg25zxtF7n74h0Hi4Ojfah56USoo/zurxkFdke2HzSc
         ldoQ==
X-Gm-Message-State: AFuF++l3t51ROlJTPvg0uC5AHPcfIlKeMggullZeH+fh8ENGAMemo3SO
	zhsQmOaNBrcRuYQP5VprE6drUFEmfSCE6iDzHxgruFCcAaApJzBuQ80L
X-Gm-Gg: AYBFou28TsMROLi9JvrDreTNhim9vaP9+MfWLUr58bdhWQCqrMebCJpaKugWjD/0tr4
	KR5lYYbPuNhZHVu1Xpe388UI1UShYmoOsDf1rTtN8y9cZzAZ8dzhS96WIUdOMSPpOLf+EM49sq/
	PcmQyHWAGEW7hobcgU5aKikvtNdF9D6uRh94IpUkYzcfTqiEUuzVxNmalgehgebO9ehTTk1ujx0
	MdmXXyrAUsYmSSPafgQ5WsyJuAZv7fTVVoSCNauxlV/+iDPu/RfrBQvMnueACj6/FbgO1CWd69R
	wSEGWEUU+cRxQ4Qnvljgie/VBU3Z5WcnlasoINm+QZRAXM2pzmNmfCVQqib6AqGMmZ5SP0OAMfm
	LUXl/kWCMBTFDbe14PqfHAeiXBBSvHhymA+j/9+BlCtgg6RpWJtKuKpDkpKOWmZH3wqcBm8oNpF
	TPgEd8UJttZOUBReRKGJXJiH1vDcK1LdMrt3LZKorYGdlNCi/1B5QjmR2PLRwTEM8F3/P+ad+Yb
	JbPtQ==
X-Received: by 2002:a05:6214:acf:b0:910:3923:cc6b with SMTP id 6a1803df08f44-9103923d142mr240278646d6.20.1788804806567;
        Mon, 07 Sep 2026 11:13:26 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bbb79sm97374976d6.47.2026.09.07.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:13:26 -0700 (PDT)
From: BurningHoryd <sjunhyuk1@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: SM8250 USB-C DP alt mode: DP AUX times out in reversed (CC2) cable orientation
Date: Mon,  7 Sep 2026 14:13:25 -0400
Message-ID: <20260907181325.89746-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e1971874-6e06-4ffb-8118-c4acc40144eb@linaro.org>
References: <20260906225206.2994952-1-sjunhyuk1@gmail.com> <f0fc4211-2040-4115-9847-6e5cc3fe8161@linaro.org> <20260907162643.36585-1-sjunhyuk1@gmail.com> <e1971874-6e06-4ffb-8118-c4acc40144eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/7/26 18:35, Neil Armstrong wrote:
> Yes if it's a discrete SBU mux, gpio-sbu-mux was designed for that, and
> keep the nb7vpq904m and just drop the SBU link to the redriver and replace
> it with a link to the SBU mux instead.

That fixed it. A gpio-sbu-mux node on TLMM 8 (select) / TLMM 9 (enable),
the connector's SBU graph endpoint moved from the nb7vpq904m to it, and
the nb7vpq904m's enable-gpios dropped (TLMM 9 is the mux enable, not the
redriver enable). nb7vpq904m stays as the SS retimer-switch.

Reversed orientation now brings DP up reliably - one normal plug and
three reversed re-plugs, all four train to 4 lanes and stay connected,
no more DPCD read timeout. Normal orientation is unchanged.

This board (Retroid Pocket 5) isn't upstream yet, so the fix lands
downstream for now, but thanks a lot for the quick pointer - "nb7vpq904m
alone doesn't switch SBU" was exactly the piece I was missing.

BurningHoryd
